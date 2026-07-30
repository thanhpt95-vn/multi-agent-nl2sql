#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Complete pipeline for running NL2SQL experiments with CrewAI and evaluating
them with test-suite-sql-eval.
"""

import os
import sys
import hashlib
import inspect

# Disable CrewAI telemetry to avoid timeouts while sending telemetry data.
os.environ["CREWAI_DISABLE_TELEMETRY"] = "true"

import json
import csv
import shutil
import subprocess
from datetime import datetime
from pathlib import Path
from typing import List, Dict, Tuple
import time
import re
import argparse
from dotenv import load_dotenv
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


# Fixed base paths for project components.
DATA_DIR = Path("data")                   # Shared data for all pipelines.
SPIDER_DATA_DIR = DATA_DIR / "spider_data"       # Contains the Spider databases.
OUTPUT_BASE_DIR = Path("output")          # Shared output directory.
DEV_QUESTIONS_FILE = OUTPUT_BASE_DIR / "questions_dev.json"

# Global variables determined by the pipeline type (4-step / 5-step / 6-step).
NL2SQL_BASE_DIR: Path | None = None       # Set by configure_pipeline().
PIPELINE_OUTPUT_DIR: Path | None = None   # Pipeline-specific output directory.
PIPELINE_TYPE: str = "4step"              # "4step" | "6step" | "5step_without_planner" | "5step_without_refiner"
_CONFIGURED_PIPELINE_PATH: str | None = None

# CLI aliases → canonical PIPELINE_TYPE
PIPELINE_TYPE_ALIASES = {
    "4step": "4step",
    "6step": "6step",
    "5step_without_planner": "5step_without_planner",
    "5step_without_refiner": "5step_without_refiner",
    "without_planner": "5step_without_planner",
    "without_refiner": "5step_without_refiner",
    "5step_no_planner": "5step_without_planner",
    "5step_no_refiner": "5step_without_refiner",
    "no_planner": "5step_without_planner",
    "no_refiner": "5step_without_refiner",
}


def normalize_pipeline_type(pipeline_type: str) -> str:
    key = pipeline_type.strip().lower().replace("-", "_")
    if key not in PIPELINE_TYPE_ALIASES:
        raise ValueError(
            "pipeline_type must be one of: 4step, 6step, "
            "5step_without_planner (without_planner), "
            "5step_without_refiner (without_refiner); "
            f"got {pipeline_type!r}"
        )
    return PIPELINE_TYPE_ALIASES[key]


def uses_six_step_codebase() -> bool:
    """5-step variants reuse src/nl2sql_6step with one stage skipped."""
    return PIPELINE_TYPE == "6step" or PIPELINE_TYPE.startswith("5step_")


def code_package_key() -> str:
    """Directory name under src/: nl2sql_4step or nl2sql_6step."""
    return "4step" if PIPELINE_TYPE == "4step" else "6step"


def _clear_ablation_skip_flags() -> None:
    os.environ.pop("NL2SQL_SKIP_PLANNER", None)
    os.environ.pop("NL2SQL_SKIP_REFINER", None)


def _apply_5step_route(pipeline_type: str) -> None:
    """Full-LLM 5-stage route: skip one stage, never seed from 4-step cache."""
    for key in ("NL2SQL_SEED_FROM_4STEP", "NL2SQL_SEED_INCLUDE_DIRECT"):
        os.environ.pop(key, None)
    if pipeline_type == "5step_without_planner":
        os.environ["NL2SQL_SKIP_PLANNER"] = "1"
        os.environ.pop("NL2SQL_SKIP_REFINER", None)
    elif pipeline_type == "5step_without_refiner":
        os.environ["NL2SQL_SKIP_REFINER"] = "1"
        os.environ.pop("NL2SQL_SKIP_PLANNER", None)
    else:
        raise ValueError(pipeline_type)


def configure_pipeline(pipeline_type: str) -> None:
    """
    Configure paths and environment variables for a 4-, 5-, or 6-step pipeline.

    5-step variants use the 6-step codebase with Planner or Refiner removed.
    Every remaining stage calls the LLM (no 4-step early-stage seed).
    """
    global NL2SQL_BASE_DIR, PIPELINE_OUTPUT_DIR, PIPELINE_TYPE
    global _CONFIGURED_PIPELINE_PATH

    PIPELINE_TYPE = normalize_pipeline_type(pipeline_type)

    if PIPELINE_TYPE == "4step":
        NL2SQL_BASE_DIR = Path("src") / "nl2sql_4step"
        PIPELINE_OUTPUT_DIR = OUTPUT_BASE_DIR / "nl2sql_4step"
        _clear_ablation_skip_flags()
    elif PIPELINE_TYPE == "6step":
        NL2SQL_BASE_DIR = Path("src") / "nl2sql_6step"
        PIPELINE_OUTPUT_DIR = OUTPUT_BASE_DIR / "nl2sql_6step"
        _clear_ablation_skip_flags()
    elif PIPELINE_TYPE == "5step_without_planner":
        NL2SQL_BASE_DIR = Path("src") / "nl2sql_6step"
        PIPELINE_OUTPUT_DIR = OUTPUT_BASE_DIR / "nl2sql_5step" / "without_planner"
        _apply_5step_route(PIPELINE_TYPE)
    elif PIPELINE_TYPE == "5step_without_refiner":
        NL2SQL_BASE_DIR = Path("src") / "nl2sql_6step"
        PIPELINE_OUTPUT_DIR = OUTPUT_BASE_DIR / "nl2sql_5step" / "without_refiner"
        _apply_5step_route(PIPELINE_TYPE)
    else:
        raise ValueError(f"Unhandled pipeline_type: {PIPELINE_TYPE}")

    PIPELINE_OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # Root .env is the project's single source of API keys/model overrides.
    # A pipeline-local .env remains an optional fallback for backward
    # compatibility, but never overrides root or shell environment variables.
    project_root = Path(__file__).resolve().parent
    load_dotenv(project_root / ".env")
    load_dotenv(NL2SQL_BASE_DIR / ".env")  # type: ignore[arg-type]

    # The 4-step and 6-step packages intentionally share the import name
    # ``nl2sql_flow``. If a process switches pipelines, remove the old package
    # from both sys.path and sys.modules before importing the new one.
    base_dir_str = str(NL2SQL_BASE_DIR.resolve())
    if _CONFIGURED_PIPELINE_PATH and _CONFIGURED_PIPELINE_PATH != base_dir_str:
        sys.path = [
            path
            for path in sys.path
            if str(Path(path).resolve()) != _CONFIGURED_PIPELINE_PATH
        ]
        for module_name in list(sys.modules):
            if module_name == "nl2sql_flow" or module_name.startswith("nl2sql_flow."):
                del sys.modules[module_name]
    if base_dir_str not in sys.path:
        sys.path.insert(0, base_dir_str)
    _CONFIGURED_PIPELINE_PATH = base_dir_str

    skip_note = ""
    if PIPELINE_TYPE == "5step_without_planner":
        skip_note = " [skip Planner; full LLM]"
    elif PIPELINE_TYPE == "5step_without_refiner":
        skip_note = " [skip Refiner; full LLM]"
    print(
        f"🔧 Configured pipeline: {PIPELINE_TYPE} "
        f"(base dir = {NL2SQL_BASE_DIR}){skip_note}"
    )
    print(f"   output = {PIPELINE_OUTPUT_DIR}")


def compute_pipeline_signature() -> str:
    """Hash code, prompts, and model routing so stale raw caches are rejected."""
    if NL2SQL_BASE_DIR is None:
        raise RuntimeError("Pipeline has not been configured")
    digest = hashlib.sha256()
    relative_files = (
        "nl2sql_flow/main.py",
        "nl2sql_flow/crews/nl2sql_crew/nl2sql_crew.py",
        "nl2sql_flow/crews/nl2sql_crew/config/agents.yaml",
        "nl2sql_flow/crews/nl2sql_crew/config/tasks.yaml",
    )
    digest.update(Path(__file__).read_bytes())
    for relative_file in relative_files:
        path = NL2SQL_BASE_DIR / relative_file
        digest.update(relative_file.encode("utf-8"))
        if path.is_file():
            digest.update(path.read_bytes())
    # Operational knobs should not invalidate resume caches.
    signature_ignore = {
        "NL2SQL_STEP_TIMEOUT_SECONDS",
        "NL2SQL_STEP_MAX_RETRIES",
        "NL2SQL_ABORT_ON_FAILURE",
        "NL2SQL_RESUME_IGNORE_SIGNATURE",
    }
    for name in sorted(
        key
        for key in os.environ
        if key.startswith("NL2SQL_") and key not in signature_ignore
    ):
        digest.update(name.encode("utf-8"))
        digest.update(os.environ[name].encode("utf-8"))
    digest.update(PIPELINE_TYPE.encode("utf-8"))
    return digest.hexdigest()[:20]


def assert_loaded_pipeline(flow_class: type) -> None:
    """Fail fast if Python imported the other pipeline's shared package name."""
    loaded_path = Path(inspect.getfile(flow_class)).resolve().as_posix()
    expected_fragment = f"/src/nl2sql_{code_package_key()}/"
    if expected_fragment not in loaded_path:
        raise RuntimeError(
            f"Loaded wrong pipeline module: expected {expected_fragment}, "
            f"got {loaded_path}"
        )


_TRUE_ENV_VALUES = {"1", "true", "yes", "on", "enabled"}
_FALSE_ENV_VALUES = {"0", "false", "no", "off", "disabled"}
_SIX_STEP_TRACE_PHASES = (
    "question_analysis",
    "schema_selector",
    "query_planning",
    "generate_sql_direct",
    "generate_sql_planned",
    "refine_sql",
    "validate_sql",
)
_DEFAULT_REFINER_MODEL = "gemini/gemini-2.5-flash"


def env_flag(name: str, default: bool = False) -> bool:
    """Read a strict boolean environment flag."""
    value = os.getenv(name)
    if value is None:
        return default
    normalized = value.strip().lower()
    if normalized in _TRUE_ENV_VALUES:
        return True
    if normalized in _FALSE_ENV_VALUES:
        return False
    raise ValueError(f"{name} must be a boolean value")


def count_trace_attempts(step_traces: List[Dict]) -> int:
    """Count actual inference attempts, including failed retries."""
    count = 0
    for trace in step_traces:
        try:
            attempt = int(trace.get("attempt", 0))
        except (TypeError, ValueError):
            attempt = 0
        if attempt > 0:
            count += 1
    return count


def validate_configured_provider_keys() -> None:
    """Fail before inference when a configured provider key is absent."""
    if env_flag("USE_LOCAL_LLM", default=False):
        return

    if PIPELINE_TYPE == "4step":
        configured_models = [
            "gemini/gemini-2.5-flash",
            "openai/gpt-4o",
        ]
    else:
        # 6-step and 5-step variants share the same model env surface.
        configured_models = [
            os.getenv(
                "NL2SQL_QUESTION_ANALYZER_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_QUESTION_ANALYZER_FALLBACK_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_SCHEMA_SELECTOR_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_QUERY_PLANNER_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_QUERY_PLANNER_FALLBACK_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_DIRECT_SQL_MODEL",
                os.getenv("NL2SQL_SQL_EXPERT_MODEL", "openai/gpt-4o"),
            ),
            os.getenv(
                "NL2SQL_PLANNED_SQL_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_PLANNED_SQL_FALLBACK_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_SQL_REFINER_MODEL",
                _DEFAULT_REFINER_MODEL,
            ),
            os.getenv(
                "NL2SQL_SQL_REFINER_FALLBACK_MODEL",
                "gemini/gemini-2.5-flash",
            ),
            os.getenv(
                "NL2SQL_SQL_VALIDATOR_MODEL",
                "gemini/gemini-2.5-flash",
            ),
        ]

    provider_keys = {
        "anthropic": "ANTHROPIC_API_KEY",
        "claude": "ANTHROPIC_API_KEY",
        "deepseek": "DEEPSEEK_API_KEY",
        "gemini": "GEMINI_API_KEY",
        "openai": "OPENAI_API_KEY",
        "gpt": "OPENAI_API_KEY",
    }
    required_keys = set()
    for model in configured_models:
        normalized = str(model).strip().lower()
        provider = normalized.split("/", 1)[0].split("-", 1)[0]
        key_name = provider_keys.get(provider)
        if key_name:
            required_keys.add(key_name)
    missing = sorted(
        key_name
        for key_name in required_keys
        if not os.getenv(key_name, "").strip()
    )
    if missing:
        raise RuntimeError(
            "Missing API key(s) for configured models: "
            + ", ".join(missing)
        )


def validate_six_step_trace(step_traces: List[Dict]) -> None:
    """Validate logical phase order while allowing retries and skipped phases."""
    phase_index = {
        phase_name: index
        for index, phase_name in enumerate(_SIX_STEP_TRACE_PHASES)
    }
    seen_phases = set()
    terminal_trace_by_phase: Dict[str, Dict] = {}
    last_phase_index = -1

    for trace_index, trace in enumerate(step_traces):
        step_name = trace.get("step_name")
        if step_name not in phase_index:
            raise RuntimeError(
                f"Invalid 6-step trace entry {trace_index}: "
                f"unknown step_name={step_name!r}"
            )
        current_phase_index = phase_index[step_name]
        if current_phase_index < last_phase_index:
            raise RuntimeError(
                "Invalid 6-step trace order: "
                f"{step_name!r} appears after "
                f"{_SIX_STEP_TRACE_PHASES[last_phase_index]!r}"
            )
        last_phase_index = current_phase_index
        seen_phases.add(step_name)
        terminal_trace_by_phase[step_name] = trace

    missing_phases = [
        phase_name
        for phase_name in _SIX_STEP_TRACE_PHASES
        if phase_name not in seen_phases
    ]
    if missing_phases:
        raise RuntimeError(
            f"Invalid 6-step trace: missing logical phases {missing_phases}"
        )
    failed_terminal_phases = [
        phase_name
        for phase_name in _SIX_STEP_TRACE_PHASES
        if not terminal_trace_by_phase[phase_name].get("success", False)
        and not terminal_trace_by_phase[phase_name].get("skipped", False)
    ]
    if failed_terminal_phases:
        raise RuntimeError(
            "Invalid 6-step trace: phases did not finish successfully or "
            f"skip explicitly: {failed_terminal_phases}"
        )


def fetch_anthropic_model_ids(
    api_key: str,
    *,
    base_url: str = "https://api.anthropic.com",
    timeout: int = 10,
) -> set[str]:
    """List model IDs visible to an Anthropic key without running inference."""
    if not api_key.strip():
        raise RuntimeError(
            "Anthropic model preflight requires ANTHROPIC_API_KEY"
        )

    normalized_base = base_url.rstrip("/")
    models_endpoint = (
        f"{normalized_base}/models"
        if normalized_base.endswith("/v1")
        else f"{normalized_base}/v1/models"
    )
    model_ids: set[str] = set()
    after_id = ""

    for _ in range(20):
        query = {"limit": 100}
        if after_id:
            query["after_id"] = after_id
        request = Request(
            f"{models_endpoint}?{urlencode(query)}",
            method="GET",
            headers={
                "x-api-key": api_key,
                "anthropic-version": "2023-06-01",
                "accept": "application/json",
            },
        )
        try:
            with urlopen(request, timeout=timeout) as response:
                payload = json.loads(response.read().decode("utf-8"))
        except HTTPError as error:
            raise RuntimeError(
                "Anthropic model preflight failed "
                f"with HTTP status {error.code}"
            ) from error
        except (URLError, TimeoutError) as error:
            raise RuntimeError(
                "Anthropic model preflight could not reach the models endpoint"
            ) from error
        except (UnicodeDecodeError, json.JSONDecodeError) as error:
            raise RuntimeError(
                "Anthropic model preflight returned invalid JSON"
            ) from error

        if not isinstance(payload, dict):
            raise RuntimeError(
                "Anthropic model preflight returned an invalid response shape"
            )
        data = payload.get("data")
        if not isinstance(data, list):
            raise RuntimeError(
                "Anthropic model preflight response is missing model data"
            )
        model_ids.update(
            item["id"]
            for item in data
            if isinstance(item, dict) and isinstance(item.get("id"), str)
        )
        if not payload.get("has_more"):
            return model_ids
        next_after_id = payload.get("last_id")
        if not isinstance(next_after_id, str) or not next_after_id:
            if data and isinstance(data[-1], dict):
                next_after_id = data[-1].get("id")
        if not isinstance(next_after_id, str) or not next_after_id:
            raise RuntimeError(
                "Anthropic model preflight pagination is missing last_id"
            )
        after_id = next_after_id

    raise RuntimeError("Anthropic model preflight exceeded 20 model pages")


def preflight_configured_refiner() -> None:
    """Fail before paid inference when the six-step Anthropic model is absent."""
    # 5-step without Refiner does not call the Refiner LLM.
    if not uses_six_step_codebase() or env_flag("NL2SQL_SKIP_REFINER", default=False):
        return
    if env_flag("NL2SQL_SKIP_MODEL_PREFLIGHT", default=False):
        print("[PREFLIGHT] Anthropic model check skipped by configuration.")
        return

    configured_model = os.getenv(
        "NL2SQL_SQL_REFINER_MODEL",
        _DEFAULT_REFINER_MODEL,
    ).strip()
    normalized_model = configured_model.lower()
    if normalized_model.startswith("anthropic/"):
        provider_model_id = configured_model.split("/", 1)[1]
    elif normalized_model.startswith("claude-"):
        provider_model_id = configured_model
    else:
        print("[PREFLIGHT] Refiner is not an Anthropic model; check not required.")
        return

    api_key = os.getenv("ANTHROPIC_API_KEY", "")
    timeout = int(os.getenv("NL2SQL_MODEL_PREFLIGHT_TIMEOUT_SECONDS", "10"))
    model_ids = fetch_anthropic_model_ids(
        api_key,
        base_url=os.getenv(
            "ANTHROPIC_BASE_URL",
            "https://api.anthropic.com",
        ),
        timeout=timeout,
    )
    if provider_model_id not in model_ids:
        raise RuntimeError(
            "Configured Anthropic Refiner model is unavailable to this API "
            f"account: {provider_model_id}"
        )
    print(f"[PREFLIGHT] Anthropic Refiner available: {provider_model_id}")

# Global tracking variables
ai_request_count = 0
execution_metrics = {'total': 0, 'successful': 0, 'failed': 0}
timing_metrics = {
    'setup_time': 0.0,
    'questions_loading_time': 0.0,
    'nl2sql_processing_time': 0.0,
    'conversion_time': 0.0,
    'evaluation_time': 0.0
}
api_call_details = {
    'per_question': [],  # Track API calls per question
    'enhancement_calls': 0,
    'total_agent_calls': 0
}


def setup_environment():
    """Set up the environment and copy the required databases."""
    global timing_metrics, PIPELINE_OUTPUT_DIR
    start_time = time.time()

    if PIPELINE_OUTPUT_DIR is None:
        raise RuntimeError(
            "PIPELINE_OUTPUT_DIR is not configured. Call configure_pipeline() first."
        )

    print("[SETUP] Setting up the environment...")

    # Create the output directory if it does not exist.
    os.makedirs(PIPELINE_OUTPUT_DIR, exist_ok=True)

    # Copy databases from data/spider_data to test-suite-sql-eval.
    source_db_dir = SPIDER_DATA_DIR / 'database'
    target_db_dir = Path('experiments/test-suite-sql-eval/database')

    if source_db_dir.exists() and not target_db_dir.exists():
        print(f"📁 Copying databases from {source_db_dir} to {target_db_dir}")
        shutil.copytree(source_db_dir, target_db_dir)
    elif target_db_dir.exists():
        print("✅ Databases already exist in test-suite-sql-eval")
    else:
        print("❌ Database source directory not found")
        return False

    timing_metrics['setup_time'] = time.time() - start_time
    print(f"⏱️  Setup completed in {timing_metrics['setup_time']:.2f}s")
    return True


def load_spider_dev_data():
    """Load Spider dev questions (with global index) and table schemas."""
    dev_questions_file = DEV_QUESTIONS_FILE if DEV_QUESTIONS_FILE.exists() else DATA_DIR / 'dev.json'
    tables_file = DATA_DIR / 'tables.json'

    with open(dev_questions_file, 'r', encoding='utf-8') as f:
        spider_data = json.load(f)

    with open(tables_file, 'r', encoding='utf-8') as f:
        tables_data = json.load(f)

    # Attach a stable global index (position in the dev file) to every question
    for idx, item in enumerate(spider_data):
        item['question_index'] = idx

    return spider_data, tables_data


def group_questions_by_db(spider_data):
    """Group dev questions by db_id, preserving original order."""
    db_questions: Dict[str, list] = {}
    for item in spider_data:
        db_questions.setdefault(item['db_id'], []).append(item)
    return db_questions


def collect_column_sample_values(db_id, table_schema, max_values=4, max_len=30):
    """Collect a few distinct sample values per TEXT column for value grounding.

    Returns a list aligned with column_names_original ([] for '*', unsupported
    columns, or on any error). Text samples preserve literal casing/spelling;
    boolean samples expose database sentinels such as T/F or Y/N.
    """
    import sqlite3

    columns = table_schema['column_names_original']
    types = table_schema['column_types']
    samples = [[] for _ in columns]

    db_file = SPIDER_DATA_DIR / 'database' / db_id / f'{db_id}.sqlite'
    if not db_file.exists():
        print(f"⚠️  {db_file} not found; skipping value grounding for db '{db_id}'")
        return samples

    try:
        con = sqlite3.connect(f"file:{db_file}?mode=ro", uri=True)
        con.text_factory = lambda b: b.decode(errors='replace')
        tables = table_schema['table_names_original']
        for idx, (t_idx, col_name) in enumerate(columns):
            column_type = (
                str(types[idx]).lower() if idx < len(types) else ""
            )
            if t_idx < 0 or column_type not in {'text', 'boolean'}:
                continue
            try:
                rows = con.execute(
                    f'SELECT DISTINCT "{col_name}" FROM "{tables[t_idx]}" '
                    f'WHERE "{col_name}" IS NOT NULL LIMIT {max_values}'
                ).fetchall()
                samples[idx] = [str(r[0])[:max_len] for r in rows]
            except Exception:
                pass  # per-column failure is non-fatal
        con.close()
        n_grounded = sum(1 for s in samples if s)
        print(
            "🔎 Value grounding: collected sample values for "
            f"{n_grounded} text/boolean columns in '{db_id}'"
        )
    except Exception as e:
        print(f"⚠️  Value grounding failed ({e}); continuing without sample values")
    return samples


def get_test_questions(num_questions=40, db_id=None, seed=None):
    """Get Spider dev-set questions with an optional database and random seed.

    ``num_questions <= 0`` selects every question for the database in its
    original order.
    """
    global timing_metrics
    start_time = time.time()

    import random
    rng = random.Random(seed)

    spider_data, tables_data = load_spider_dev_data()

    # Count questions by database.
    print("🔍 Analyzing the Spider dev set...")
    db_questions = group_questions_by_db(spider_data)
    db_counts = {db: len(qs) for db, qs in db_questions.items()}

    requested_db_id = db_id

    # Keep databases with more than 50 questions for quick random benchmarks.
    eligible_dbs = {db: count for db, count in db_counts.items() if count > 50}
    print(f"📊 Found {len(eligible_dbs)} databases with more than 50 questions:")

    # Sort and display the top databases.
    sorted_dbs = sorted(eligible_dbs.items(), key=lambda x: x[1], reverse=True)
    for i, (db, count) in enumerate(sorted_dbs[:10], 1):
        print(f"   {i}. {db}: {count} questions")

    if requested_db_id is not None:
        if requested_db_id not in db_questions:
            available_db_preview = ", ".join(sorted(db_questions.keys())[:15])
            raise ValueError(
                f"db_id '{requested_db_id}' does not exist in the Spider dev set. "
                f"Example valid db_id values: {available_db_preview}"
            )
        selected_db = requested_db_id
        available_questions = db_questions[selected_db]
        print(
            f"\n🎯 Using the user-specified database: '{selected_db}' "
            f"with {len(available_questions)} questions"
        )
    else:
        # Randomly choose a database with more than 50 questions for a quick benchmark.
        selected_db = rng.choice(list(eligible_dbs.keys()))
        available_questions = db_questions[selected_db]
        print(
            f"\n🎯 Randomly selected database: '{selected_db}' "
            f"with {len(available_questions)} questions"
        )

    if seed is not None:
        print(f"🎲 Sampling seed: {seed}")

    # In full-benchmark mode, select every database question in its original order.
    if num_questions <= 0:
        print(
            f"📋 Full-database mode: selecting all {len(available_questions)} "
            "questions without sampling"
        )
        selected_items = available_questions
    elif num_questions > len(available_questions):
        print(
            f"⚠️  Requested {num_questions} questions, but only "
            f"{len(available_questions)} are available. Selecting all questions."
        )
        selected_items = available_questions
    else:
        selected_items = rng.sample(available_questions, num_questions)

    # Find the matching schema and build test_questions.
    test_questions = []
    table_schema = None
    for table in tables_data:
        if table['db_id'] == selected_db:
            table_schema = table
            break

    if table_schema:
        # Value grounding: collect sample values per text column once per database
        sample_values = collect_column_sample_values(selected_db, table_schema)
        for item in selected_items:
            test_questions.append({
                'question_index': item.get('question_index', -1),
                'db_id': item['db_id'],
                'question': item['question'],
                'gold_query': item['query'],  # Add the ground-truth query.
                'table_names': table_schema.get(
                    'table_names', table_schema['table_names_original']
                ),
                'table_names_original': table_schema['table_names_original'],
                'column_names': table_schema.get(
                    'column_names', table_schema['column_names_original']
                ),
                'column_names_original': table_schema['column_names_original'],
                'column_types': table_schema['column_types'],
                'foreign_keys': table_schema.get('foreign_keys', []),
                'primary_keys': table_schema.get('primary_keys', []),
                'column_sample_values': sample_values,
            })

    print(
        f"\n📝 Prepared {len(test_questions)} test questions "
        f"from database '{selected_db}':"
    )
    for i, q in enumerate(test_questions, 1):
        print(f"   {i}. {q['question'][:70]}...")

    timing_metrics['questions_loading_time'] = time.time() - start_time
    print(
        f"⏱️  Questions loading completed in {timing_metrics['questions_loading_time']:.2f}s")

    return test_questions


def enhance_sql_query(sql_query: str, question_text: str, schema: dict) -> dict:
    """
    Simple SQL enhancement function - placeholder for more sophisticated enhancement
    """
    global api_call_details

    # This is a placeholder - in real implementation, this might call AI services
    # For now, just basic formatting
    try:
        # Simulate enhancement processing
        api_call_details['enhancement_calls'] += 1

        # Basic SQL formatting
        enhanced_sql = sql_query.strip()
        if not enhanced_sql.endswith(';'):
            enhanced_sql += ';'

        # Simple improvements check
        improvements_made = enhanced_sql != sql_query

        return {
            'enhanced_sql': enhanced_sql,
            'improvements_made': improvements_made,
            'enhancement_type': 'formatting' if improvements_made else 'none'
        }
    except Exception as e:
        print(f"⚠️  SQL enhancement error: {e}")
        return {
            'enhanced_sql': sql_query,
            'improvements_made': False,
            'enhancement_type': 'error'
        }


def run_nl2sql_system(test_questions):
    """Run the CrewAI NL2SQL system."""
    global ai_request_count, execution_metrics, timing_metrics, api_call_details, PIPELINE_OUTPUT_DIR, PIPELINE_TYPE
    start_time = time.time()

    if PIPELINE_OUTPUT_DIR is None:
        raise RuntimeError(
            "PIPELINE_OUTPUT_DIR is not configured. Call configure_pipeline() first."
        )

    strict_benchmark = env_flag("NL2SQL_STRICT_BENCHMARK", default=False)
    abort_on_failure = env_flag("NL2SQL_ABORT_ON_FAILURE", default=False)
    resume_ignore_signature = env_flag(
        "NL2SQL_RESUME_IGNORE_SIGNATURE", default=False
    )
    validate_configured_provider_keys()
    preflight_configured_refiner()

    print("\n🤖 Running the CrewAI NL2SQL system...")

    # Import the required CrewAI modules.
    try:
        from pydantic import BaseModel
        import nl2sql_flow.main as nl2sql_main
        from nl2sql_flow.main import NL2SQLFlow, NLQuestions, SQLDbSchema, NL2SQLResult
        assert_loaded_pipeline(NL2SQLFlow)
        load_four_step_seed_file = getattr(
            nl2sql_main, "load_four_step_seed_file", None
        )
        map_four_step_seed_to_six_steps = getattr(
            nl2sql_main, "map_four_step_seed_to_six_steps", None
        )
    except ImportError as e:
        print(f"❌ Failed to import CrewAI modules: {e}")
        print("💡 Make sure CrewAI and its dependencies are installed")
        return None

    # The schema is already loaded in test_questions.

    # Create a pipeline-specific CSV output file.
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    csv_filename = str(
        PIPELINE_OUTPUT_DIR / f'nl2sql_results_{PIPELINE_TYPE}_{timestamp}.csv'
    )

    # Initialize CSV file
    with open(csv_filename, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['db_id', 'question',
                      'gold_query', 'sql', 'explain', 'error']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

    results = []
    execution_metrics['total'] = len(test_questions)

    # Directory for storing each agent's raw responses by question.
    raw_responses_dir = PIPELINE_OUTPUT_DIR / 'raw_responses'
    run_signature = compute_pipeline_signature()

    for i, question in enumerate(test_questions, 1):
        question_start_time = time.time()
        print(
            f"\n📊 Processing question {i}/{len(test_questions)}: "
            f"{question['question'][:50]}..."
        )

        q_index = question.get('question_index', i)
        raw_db_dir = raw_responses_dir / question['db_id']
        raw_file = raw_db_dir / f"q{q_index:04d}.json"
        flow = None
        step_traces: List[Dict] = []
        question_api_calls = 0
        api_calls_recorded = False

        # Reuse a previous result when available without calling the API again.
        if raw_file.exists():
            try:
                with open(raw_file, 'r', encoding='utf-8') as f:
                    cached = json.load(f)
                if cached.get('run_signature') != run_signature:
                    if resume_ignore_signature:
                        print(
                            f"   ⚠️  Cache signature mismatch for {raw_file.name}; "
                            "NL2SQL_RESUME_IGNORE_SIGNATURE=1 → reuse cache."
                        )
                    else:
                        raise ValueError(
                            "cache signature differs from the active code/prompts/models"
                        )
                if (
                    cached.get('db_id') != question['db_id']
                    or cached.get('question') != question['question']
                ):
                    raise ValueError("cache question identity mismatch")
                result = {
                    'db_id': cached['db_id'],
                    'question': cached['question'],
                    'gold_query': cached['gold_query'],
                    'sql': cached.get('final_sql', ''),
                    'explain': cached.get('explain', ''),
                    'error': cached.get('error', ''),
                }
                results.append(result)
                if result['sql'] and not result['error']:
                    execution_metrics['successful'] += 1
                else:
                    execution_metrics['failed'] += 1
                with open(csv_filename, 'a', newline='', encoding='utf-8') as csvfile:
                    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                    writer.writerow(result)
                api_call_details['per_question'].append({
                    'question_id': i,
                    'question': question['question'][:50] + '...',
                    'api_calls': 0,
                    'processing_time': time.time() - question_start_time,
                    'success': bool(result['sql'] and not result['error']),
                    'cache_hit': True,
                })
                print(f"   ⏩ Reusing previous result ({raw_file.name}); skipping.")
                continue
            except Exception as e:
                print(
                    f"   ⚠️  Could not read cache {raw_file.name} ({e}); "
                    "rerunning this question."
                )

        try:
            # Run the NL2SQL flow with the schema already attached to the question.
            print("   🔄 Running the multi-agent flow...")

            seed_steps = None
            seed_meta = None
            seed_root = os.getenv("NL2SQL_SEED_FROM_4STEP", "").strip()
            if (
                PIPELINE_TYPE == "6step"
                and seed_root
                and load_four_step_seed_file
                and map_four_step_seed_to_six_steps
            ):
                four_raw = load_four_step_seed_file(
                    Path(seed_root),
                    question["db_id"],
                    int(q_index),
                    question["question"],
                )
                if four_raw:
                    seed_steps = map_four_step_seed_to_six_steps(four_raw)
                    seed_meta = {
                        "seed_root": str(Path(seed_root).resolve()),
                        "seeded_steps": sorted(seed_steps.keys()),
                        "source_question_index": four_raw.get("question_index"),
                        "source_db_id": four_raw.get("db_id"),
                    }
                    print(
                        "   🌱 Hybrid 4→6 seed: "
                        + (", ".join(seed_meta["seeded_steps"]) or "(none)")
                    )
                else:
                    print(
                        f"   ⚠️  No 4-step seed found for "
                        f"{question['db_id']}/q{int(q_index):04d}; "
                        "running the full 6-step pipeline."
                    )

            flow_kwargs = {}
            if seed_steps is not None:
                flow_kwargs["seed_steps"] = seed_steps
            flow = NL2SQLFlow(
                _question=NLQuestions(
                    question=question['question'], db_id=question['db_id']),
                _raw_schema=SQLDbSchema(
                    db_id=question['db_id'],
                    table_names=question.get(
                        'table_names', question['table_names_original']
                    ),
                    table_names_original=question['table_names_original'],
                    column_names=question.get(
                        'column_names', question['column_names_original']
                    ),
                    column_names_original=question['column_names_original'],
                    column_types=question['column_types'],
                    foreign_keys=question.get('foreign_keys', []),
                    primary_keys=question.get('primary_keys', []),
                    column_sample_values=question.get('column_sample_values', []),
                ),
                **flow_kwargs,
            )
            flow_result = flow.kickoff()
            step_traces = getattr(flow, 'step_traces', [])
            question_api_calls = count_trace_attempts(step_traces)
            if uses_six_step_codebase():
                validate_six_step_trace(step_traces)
            ai_request_count += question_api_calls
            api_call_details['total_agent_calls'] += question_api_calls
            api_calls_recorded = True

            result = {
                'db_id': flow_result.db_id,
                'question': flow_result.question,
                'gold_query': question['gold_query'],  # Add the ground-truth query.
                'sql': flow_result.result.sql,
                'explain': flow_result.result.explain,
                'error': flow_result.result.error,
            }
            if strict_benchmark and (
                not (result['sql'] or '').strip() or result['error']
            ):
                raise RuntimeError(
                    "Strict benchmark received an empty or errored flow result: "
                    f"{result['error'] or 'empty SQL'}"
                )

            # Save raw responses from every agent step for this question.
            os.makedirs(raw_db_dir, exist_ok=True)
            raw_payload = {
                'question_index': q_index,
                'pipeline': PIPELINE_TYPE,
                'run_signature': run_signature,
                'db_id': question['db_id'],
                'question': question['question'],
                'gold_query': question['gold_query'],
                'steps': step_traces,
                'final_sql': result['sql'],
                'explain': result['explain'],
                'error': result['error'],
                'timestamp': datetime.now().isoformat(),
            }
            if seed_meta is not None:
                raw_payload['hybrid_seed_from_4step'] = seed_meta
            with open(raw_file, 'w', encoding='utf-8') as f:
                json.dump(raw_payload, f, ensure_ascii=False, indent=2)

            # ===== PHASE 1 IMPROVEMENT: SQL Enhancement =====
            if result['sql'] and not result['error']:
                print("   🚀 Applying Phase 1 SQL enhancements...")
                try:
                    enhancement_result = enhance_sql_query(
                        sql_query=result['sql'],
                        question_text=result['question'],
                        schema={
                            'table_names_original': question['table_names_original'],
                            'column_names_original': question['column_names_original'],
                            'column_types': question['column_types']
                        }
                    )

                    if enhancement_result['improvements_made']:
                        original_sql = result['sql']
                        result['sql'] = enhancement_result['enhanced_sql']
                        result['explain'] += f" [Enhanced from: {original_sql[:30]}...]"
                        print(
                            f"   ✨ SQL enhanced: {enhancement_result['enhanced_sql'][:50]}...")
                    else:
                        print("   ✅ No enhancements needed")

                except Exception as e:
                    print(f"   ⚠️  Enhancement failed: {e}")
                    # Continue with original SQL if enhancement fails

            # Track successful execution
            if result['sql'] and not result['error']:
                execution_metrics['successful'] += 1
            else:
                execution_metrics['failed'] += 1

            results.append(result)

            # Write the result to CSV.
            with open(csv_filename, 'a', newline='', encoding='utf-8') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                writer.writerow(result)

            # Track per-question timing and API calls
            question_time = time.time() - question_start_time
            api_call_details['per_question'].append({
                'question_id': i,
                'question': question['question'][:50] + '...',
                # enhance_sql_query is local formatting, not a provider request.
                'api_calls': question_api_calls,
                'processing_time': question_time,
                'success': bool(result['sql'] and not result['error'])
            })

            print(
                f"   ✅ Completed: SQL = {result['sql'][:50]}... "
                f"(⏱️ {question_time:.1f}s)"
            )

        except Exception as e:
            print(f"   ❌ Failed to process question: {e}")
            execution_metrics['failed'] += 1
            partial_steps = getattr(flow, 'step_traces', []) if flow else []
            failed_api_calls = count_trace_attempts(partial_steps)
            if not api_calls_recorded:
                ai_request_count += failed_api_calls
                api_call_details['total_agent_calls'] += failed_api_calls

            # Save a separate .error.json trace so resuming retries this question.
            try:
                os.makedirs(raw_db_dir, exist_ok=True)
                error_trace_file = raw_db_dir / f"q{q_index:04d}.error.json"
                with open(error_trace_file, 'w', encoding='utf-8') as f:
                    json.dump({
                        'question_index': q_index,
                        'pipeline': PIPELINE_TYPE,
                        'run_signature': run_signature,
                        'db_id': question['db_id'],
                        'question': question['question'],
                        'gold_query': question['gold_query'],
                        'steps': partial_steps,
                        'api_calls': failed_api_calls,
                        'error': str(e),
                        'timestamp': datetime.now().isoformat(),
                    }, f, ensure_ascii=False, indent=2)
            except Exception as log_err:
                print(f"   ⚠️  Could not save the error trace: {log_err}")

            # Track failed question timing and API calls
            question_time = time.time() - question_start_time
            api_call_details['per_question'].append({
                'question_id': i,
                'question': question['question'][:50] + '...',
                'api_calls': failed_api_calls,
                'processing_time': question_time,
                'success': False
            })

            # Keep one evaluation line even in strict mode so multi-question
            # smokes can finish EX scoring. Provider/parse failures count as
            # wrong via the SELECT 1 placeholder; error.json forces resume.
            # Abort mode stops the whole process after retries are exhausted.
            if abort_on_failure:
                print(
                    "   🛑 NL2SQL_ABORT_ON_FAILURE=1: stopping process after "
                    f"failed question {i}/{len(test_questions)}."
                )
                raise RuntimeError(
                    f"Aborting pipeline after question failure: {e}"
                ) from e

            if strict_benchmark:
                print(
                    "   ⚠️  Strict benchmark mode: recording failure and "
                    "continuing (SELECT 1 placeholder for EX)."
                )

            error_result = {
                'db_id': question['db_id'],
                'question': question['question'],
                'gold_query': question['gold_query'],
                'sql': 'SELECT 1',
                'explain': '',
                'error': str(e),
            }
            results.append(error_result)
            with open(csv_filename, 'a', newline='', encoding='utf-8') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                writer.writerow(error_result)

    timing_metrics['nl2sql_processing_time'] = time.time() - start_time
    print(
        f"\n✅ NL2SQL system run completed. Results saved to: {csv_filename}"
    )
    print(
        f"⏱️  NL2SQL processing completed in {timing_metrics['nl2sql_processing_time']:.2f}s")
    return csv_filename, results


# SQL keywords to lowercase for Spider-style normalization (order: longer first to avoid partial match)
_SQL_KEYWORDS = (
    'INTERSECT', 'EXCEPT', 'DISTINCT', 'BETWEEN', 'INNER', 'OUTER', 'ASCENDING', 'DESCENDING',
    'SELECT', 'FROM', 'WHERE', 'GROUP', 'ORDER', 'HAVING', 'LIMIT', 'JOIN', 'LEFT', 'RIGHT',
    'COUNT', 'SUM', 'AVG', 'MIN', 'MAX', 'AND', 'OR', 'NOT', 'IN', 'AS', 'ON', 'BY', 'ASC', 'DESC',
    'IS', 'NULL', 'LIKE', 'UNION', 'TRUE', 'FALSE',
)


def _alias_is_referenced_elsewhere(sql: str, alias: str, span: tuple[int, int]) -> bool:
    """True if `alias` appears as an identifier outside its AS-definition span."""
    elsewhere = sql[: span[0]] + sql[span[1] :]
    return re.search(r"\b" + re.escape(alias) + r"\b", elsewhere, flags=re.IGNORECASE) is not None


def _strip_unreferenced_as_aliases(sql: str) -> str:
    """Remove AS aliases only when they are not referenced later (e.g. in outer MAX(alias))."""

    def strip_paren_alias(match: re.Match) -> str:
        alias = match.group(1)
        if _alias_is_referenced_elsewhere(sql, alias, match.span()):
            return match.group(0)
        return ")"

    def strip_plain_alias(match: re.Match) -> str:
        alias = match.group(1)
        if _alias_is_referenced_elsewhere(sql, alias, match.span()):
            return match.group(0)
        return " "

    # ) AS alias  →  )   (keep when outer query uses the alias)
    sql = re.sub(
        r"\)\s+AS\s+([\w_]+)\b",
        strip_paren_alias,
        sql,
        flags=re.IGNORECASE,
    )
    # identifier AS alias before comma / FROM
    sql = re.sub(
        r"\bAS\s+([\w_]+)\s*(?=,)",
        strip_plain_alias,
        sql,
        flags=re.IGNORECASE,
    )
    sql = re.sub(
        r"\bAS\s+([\w_]+)\s*(?=FROM)",
        strip_plain_alias,
        sql,
        flags=re.IGNORECASE,
    )
    return sql


def normalize_sql_for_spider(sql: str) -> str:
    """
    Normalize predicted SQL toward Spider gold format to improve exact match.
    - Strip trailing semicolon and extra whitespace
    - Lowercase SQL keywords
    - Normalize string literals: single quotes -> double quotes (Spider style)
    - Remove redundant AS aliases only when the alias is not referenced elsewhere
      (keeps subquery aliases used by outer MAX(alias) / subquery.alias)
    """
    if not sql or not sql.strip():
        return sql
    s = sql.strip().rstrip(';').strip()
    # Lowercase keywords (word boundary aware)
    for kw in _SQL_KEYWORDS:
        s = re.sub(r'\b' + re.escape(kw) + r'\b', kw.lower(), s, flags=re.IGNORECASE)
    # Single-quoted string -> double-quoted (Spider style)
    def replace_quotes(m):
        return '"' + m.group(1).replace('"', '""') + '"'
    s = re.sub(r"'([^']*)'", replace_quotes, s)
    s = _strip_unreferenced_as_aliases(s)
    # Collapse multiple spaces
    s = re.sub(r'\s+', ' ', s).strip()
    return s


def convert_csv_to_evaluation_format(csv_filename, output_dir=None):
    """Convert CSV output to the evaluation format.

    If ``output_dir`` is provided (for example, a per-database directory), save
    gold and prediction files there instead of in the pipeline's shared output
    directory.
    """
    global timing_metrics, PIPELINE_OUTPUT_DIR
    start_time = time.time()

    if PIPELINE_OUTPUT_DIR is None:
        raise RuntimeError(
            "PIPELINE_OUTPUT_DIR is not configured. Call configure_pipeline() first."
        )

    print("\n🔄 Converting CSV to the evaluation format...")

    # Save gold/prediction files in the pipeline or specified per-database directory.
    target_dir = Path(output_dir) if output_dir else PIPELINE_OUTPUT_DIR
    os.makedirs(target_dir, exist_ok=True)
    predict_file = target_dir / 'predict.sql'
    gold_file = target_dir / 'gold.sql'

    # Read CSV results, which already include the ground-truth queries.
    with open(csv_filename, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)

        with open(predict_file, 'w', encoding='utf-8') as pred_f, \
                open(gold_file, 'w', encoding='utf-8') as gold_f:

            matched_count = 0
            for row in reader:
                if not row.get('gold_query'):
                    print(
                        f"⚠️ Missing ground truth for: {row['question'][:50]}..."
                    )
                    continue
                # Always emit one gold/pred line per question; empty/failed SQL → always-wrong placeholder
                pred_raw = (row.get('sql') or '').strip() or 'SELECT 1'
                gold_f.write(f"{row['gold_query']}\t{row['db_id']}\n")
                pred_sql = normalize_sql_for_spider(pred_raw)
                pred_f.write(f"{pred_sql}\t{row['db_id']}\n")
                matched_count += 1

    timing_metrics['conversion_time'] = time.time() - start_time
    print(f"✅ Conversion completed. Matched {matched_count} questions")
    print(f"   📄 Gold file: {gold_file}")
    print(f"   📄 Predict file: {predict_file}")
    print(
        f"⏱️  Conversion completed in {timing_metrics['conversion_time']:.2f}s")

    return gold_file, predict_file


def run_evaluation(gold_file, predict_file):
    """Run evaluation with test-suite-sql-eval."""
    global timing_metrics
    start_time = time.time()

    print("\n📊 Running evaluation with test-suite-sql-eval...")

    # Locate the test-suite-sql-eval directory.
    eval_dir = Path('experiments/test-suite-sql-eval')
    current_dir = Path.cwd()

    try:
        # Copy tables.json from shared data before running evaluation.
        tables_source = current_dir / DATA_DIR / 'tables.json'
        tables_target = eval_dir / 'tables.json'

        if not tables_target.exists() and tables_source.exists():
            print(
                f"📁 Copying tables.json from {tables_source} to {tables_target}"
            )
            shutil.copy2(tables_source, tables_target)
        elif tables_target.exists():
            print("✅ tables.json already exists in test-suite-sql-eval")
        else:
            print(f"⚠️ tables.json not found at {tables_source}")

        # Run from the project root with full paths; no directory change is needed.

        # Use Python from the virtual environment and run from the project root.
        import sys
        python_executable = sys.executable

        # Run evaluation from the project root with full paths.
        eval_script = os.path.join(
            current_dir, 'experiments', 'test-suite-sql-eval', 'evaluation.py')
        gold_path = str(current_dir / gold_file)
        pred_path = str(current_dir / predict_file)
        db_path = os.path.join(current_dir, 'experiments',
                               'test-suite-sql-eval', 'database')
        tables_path = os.path.join(
            current_dir, 'experiments', 'test-suite-sql-eval', 'tables.json')

        # Validate the required files using full paths before evaluation.
        required_files = {
            'evaluation.py': eval_script,
            'tables.json': tables_path,
            'gold.sql': gold_path,
            'predict.sql': pred_path
        }

        missing_files = []
        for name, path in required_files.items():
            if not Path(path).exists():
                missing_files.append(f"{name} ({path})")

        if missing_files:
            print(f"❌ Missing required files: {missing_files}")
            return None

        cmd = [
            python_executable, eval_script,
            '--gold', gold_path,
            '--pred', pred_path,
            '--db', db_path,
            '--etype', 'all',
            '--table', tables_path,
            '--plug_value'
        ]

        print(f"🚀 Running command: {' '.join(cmd)}")

        result = subprocess.run(
            cmd, capture_output=True, text=True, timeout=300)

        print("\n📋 Evaluation results:")
        print("=" * 50)
        if result.stdout:
            print(result.stdout)
        else:
            print("The evaluation script produced no output")

        if result.stderr:
            print("\n⚠️ Warnings/Errors:")
            print(result.stderr)

        if result.returncode != 0:
            print(
                f"❌ Evaluation script exited with error code: {result.returncode}"
            )
            return None

        # Parse evaluation results
        eval_result = parse_evaluation_results(result.stdout)
        timing_metrics['evaluation_time'] = time.time() - start_time
        print(
            f"⏱️  Evaluation completed in {timing_metrics['evaluation_time']:.2f}s")
        return eval_result

    except Exception as e:
        timing_metrics['evaluation_time'] = time.time() - start_time
        print(f"❌ Evaluation failed: {e}")
        print(
            f"⏱️  Evaluation failed after {timing_metrics['evaluation_time']:.2f}s")
        return None


def parse_evaluation_results(eval_output):
    """Parse evaluation output to extract metrics."""
    metrics = {'execution_rate': 0.0, 'exact_match_rate': 0.0}

    if not eval_output:
        return metrics

    try:
        # Parse execution accuracy from the EXECUTION ACCURACY table.
        # Format: execution            1.000                0.857                0.750                0.667                0.789
        exec_match = re.search(
            r'execution\s+[\d.]+\s+[\d.]+\s+[\d.]+\s+[\d.]+\s+([\d.]+)', eval_output)
        if exec_match:
            metrics['execution_rate'] = float(
                exec_match.group(1)) * 100  # Convert to percentage

        # Parse exact-match accuracy from the EXACT MATCHING ACCURACY table.
        # Format: exact match          1.000                0.429                0.625                0.333                0.526
        exact_match = re.search(
            r'exact match\s+[\d.]+\s+[\d.]+\s+[\d.]+\s+[\d.]+\s+([\d.]+)', eval_output)
        if exact_match:
            metrics['exact_match_rate'] = float(
                exact_match.group(1)) * 100  # Convert to percentage

        # Try alternative patterns if the primary patterns are not found.
        if metrics['execution_rate'] == 0.0:
            exec_alt = re.search(
                r'execution.*?([\d.]+)$', eval_output, re.MULTILINE | re.IGNORECASE)
            if exec_alt:
                val = float(exec_alt.group(1))
                metrics['execution_rate'] = val * 100 if val <= 1.0 else val

        if metrics['exact_match_rate'] == 0.0:
            exact_alt = re.search(
                r'exact match.*?([\d.]+)$', eval_output, re.MULTILINE | re.IGNORECASE)
            if exact_alt:
                val = float(exact_alt.group(1))
                metrics['exact_match_rate'] = val * 100 if val <= 1.0 else val

        print(
            f"📊 Parsed metrics: execution={metrics['execution_rate']:.1f}%, exact_match={metrics['exact_match_rate']:.1f}%")

    except Exception as e:
        print(f"⚠️ Failed to parse evaluation results: {e}")
        print(f"📋 Eval output sample: {eval_output[:500]}...")

    return metrics


def print_detailed_api_statistics():
    """Print detailed API call statistics."""
    global api_call_details

    print("\n🤖 DETAILED API CALL STATISTICS")
    print("=" * 80)

    # Summary
    total_questions = len(api_call_details['per_question'])
    successful_questions = sum(
        1 for q in api_call_details['per_question'] if q['success'])
    failed_questions = total_questions - successful_questions

    print("📊 API call overview:")
    print(f"   • Total agent calls: {api_call_details['total_agent_calls']}")
    print(
        "   • Local SQL formatting passes: "
        f"{api_call_details['enhancement_calls']}"
    )
    average_api_calls = (
        api_call_details['total_agent_calls'] / total_questions
        if total_questions
        else 0.0
    )
    print(f"   • Average API calls per question: {average_api_calls:.1f}")

    if api_call_details['per_question']:
        avg_time_per_question = sum(
            q['processing_time'] for q in api_call_details['per_question']) / len(api_call_details['per_question'])
        print(
            f"   • Average time per question: {avg_time_per_question:.2f}s"
        )

        # Top 5 slowest questions
        slowest_questions = sorted(
            api_call_details['per_question'], key=lambda x: x['processing_time'], reverse=True)[:5]
        print("\n⏱️  Top 5 slowest questions:")
        for i, q in enumerate(slowest_questions, 1):
            status = "✅" if q['success'] else "❌"
            print(
                f"   {i}. {status} {q['question']} - {q['processing_time']:.2f}s ({q['api_calls']} calls)")


def print_detailed_timing_breakdown():
    """Print a detailed timing breakdown."""
    global timing_metrics

    print("\n⏱️  DETAILED TIMING BREAKDOWN")
    print("=" * 80)

    total_time = sum(timing_metrics.values())

    print("📊 Execution-time breakdown:")
    for phase, time_spent in timing_metrics.items():
        percentage = (time_spent / total_time * 100) if total_time > 0 else 0
        phase_name = phase.replace('_', ' ').title()
        print(f"   • {phase_name:<25}: {time_spent:6.2f}s ({percentage:5.1f}%)")

    print(f"   {'='*25}   {'='*6}   {'='*7}")
    print(f"   {'Total':<25}: {total_time:6.2f}s (100.0%)")


def print_results_table(run_number, num_questions, eval_metrics, total_time):
    """Print the results table in the required format."""
    global ai_request_count, execution_metrics, timing_metrics, api_call_details

    # Calculate execution rate
    exec_rate = (execution_metrics['successful'] / execution_metrics['total']
                 * 100) if execution_metrics['total'] > 0 else 0.0

    # Get evaluation metrics
    eval_exec_rate = eval_metrics.get(
        'execution_rate', 0.0) if eval_metrics else 0.0
    exact_match_rate = eval_metrics.get(
        'exact_match_rate', 0.0) if eval_metrics else 0.0

    print("\n" + "=" * 90)
    print("📊 NL2SQL PIPELINE RESULTS")
    print("=" * 90)
    print("| Run | Questions | Execute(%) | Exact Match(%) | Agent Calls | Enhancement | Time(s) |")
    print("|------|---------|------------|----------------|-------------|-------------|--------------|")
    print(
        f"|  {run_number:2d}  |   {num_questions:2d}    |   {eval_exec_rate:5.1f}    |     {exact_match_rate:5.1f}      |     {api_call_details['total_agent_calls']:2d}      |      {api_call_details['enhancement_calls']:2d}     |   {total_time:6.1f}    |")
    print("=" * 90)

    print("\n📈 Detailed statistics:")
    print(f"   • Total questions processed: {execution_metrics['total']}")
    print(f"   • SQL generation successes: {execution_metrics['successful']}")
    print(f"   • Failures: {execution_metrics['failed']}")
    print(f"   • System success rate: {exec_rate:.1f}%")
    print(f"   • Correct execution rate (test suite): {eval_exec_rate:.1f}%")
    print(f"   • Exact-match rate: {exact_match_rate:.1f}%")
    print(
        f"   • Total agent API calls: {api_call_details['total_agent_calls']}"
    )
    print(
        f"   • Total enhancement calls: {api_call_details['enhancement_calls']}"
    )
    print(f"   • Total API calls: {ai_request_count}")
    print(f"   • Execution time: {total_time:.1f} seconds")

    # Print detailed breakdowns
    print_detailed_timing_breakdown()
    print_detailed_api_statistics()


# ===== Benchmark the full dev set by database (round 2) =====

def get_progress_file() -> Path:
    """Return the pipeline-specific progress file."""
    if PIPELINE_OUTPUT_DIR is None:
        raise RuntimeError("Call configure_pipeline() first.")
    return PIPELINE_OUTPUT_DIR / 'benchmark_progress.json'


def init_or_load_progress() -> dict:
    """Load progress or initialize databases in descending question-count order."""
    progress_file = get_progress_file()
    if progress_file.exists():
        with open(progress_file, 'r', encoding='utf-8') as f:
            return json.load(f)

    spider_data, _ = load_spider_dev_data()
    db_questions = group_questions_by_db(spider_data)
    # Run larger databases first and use the name as a stable tie-breaker.
    db_order = sorted(db_questions.keys(), key=lambda db: (-len(db_questions[db]), db))

    progress = {
        'pipeline': PIPELINE_TYPE,
        'created_at': datetime.now().isoformat(),
        'db_order': db_order,
        'databases': {
            db: {
                'status': 'pending',
                'num_questions': len(db_questions[db]),
                'successful': 0,
                'failed': 0,
                'execution_rate': None,
                'exact_match_rate': None,
                'finished_at': None,
            }
            for db in db_order
        },
    }
    save_progress(progress)
    print(f"🆕 Initialized progress file: {progress_file} ({len(db_order)} databases)")
    return progress


def save_progress(progress: dict) -> None:
    progress_file = get_progress_file()
    os.makedirs(progress_file.parent, exist_ok=True)
    with open(progress_file, 'w', encoding='utf-8') as f:
        json.dump(progress, f, ensure_ascii=False, indent=2)


def get_next_pending_db(progress: dict) -> str | None:
    for db in progress['db_order']:
        if progress['databases'][db]['status'] != 'done':
            return db
    return None


def print_benchmark_status(progress: dict) -> None:
    print(
        f"\n📋 BENCHMARK PROGRESS ({progress['pipeline']}) "
        "— largest databases first"
    )
    print("=" * 78)
    print(f"{'#':>3}  {'Database':<28} {'Questions':>9} {'Status':<10} {'EX%':>6} {'EM%':>6}")
    print("-" * 78)
    total_q = done_q = 0
    for i, db in enumerate(progress['db_order'], 1):
        info = progress['databases'][db]
        total_q += info['num_questions']
        if info['status'] == 'done':
            done_q += info['num_questions']
        ex = f"{info['execution_rate']:.1f}" if info['execution_rate'] is not None else '-'
        em = f"{info['exact_match_rate']:.1f}" if info['exact_match_rate'] is not None else '-'
        print(f"{i:>3}  {db:<28} {info['num_questions']:>8} {info['status']:<10} {ex:>6} {em:>6}")
    print("-" * 78)
    print(f"Total: {done_q}/{total_q} questions completed")
    next_db = get_next_pending_db(progress)
    if next_db:
        print(
            f"➡️  Next database: '{next_db}' — run: "
            "python run_complete_nl2sql_pipeline.py "
            f"--pipeline {progress['pipeline']} --next"
        )
    else:
        print(
            "🎉 All databases completed! Aggregate results with: "
            "python run_complete_nl2sql_pipeline.py "
            f"--pipeline {progress['pipeline']} --aggregate"
        )


def run_single_db_benchmark(db_id: str) -> None:
    """Run all questions for one database, save responses, evaluate, and update progress."""
    progress = init_or_load_progress()
    if db_id not in progress['databases']:
        raise ValueError(f"db_id '{db_id}' is not in the benchmark list.")

    info = progress['databases'][db_id]
    print(
        f"\n🚀 Starting benchmark for database '{db_id}' "
        f"({info['num_questions']} questions, pipeline {PIPELINE_TYPE})"
    )

    progress['databases'][db_id]['status'] = 'running'
    save_progress(progress)

    start_time = time.time()
    try:
        if not setup_environment():
            raise RuntimeError("Environment setup failed")

        # num_questions=0 selects all database questions and resumes from raw_responses.
        test_questions = get_test_questions(num_questions=0, db_id=db_id)

        csv_filename, results = run_nl2sql_system(test_questions)
        if not csv_filename:
            raise RuntimeError("NL2SQL system failed")

        per_db_dir = PIPELINE_OUTPUT_DIR / 'per_db' / db_id
        gold_file, predict_file = convert_csv_to_evaluation_format(csv_filename, output_dir=per_db_dir)
        eval_metrics = run_evaluation(gold_file, predict_file)

        duration = time.time() - start_time
        print_results_table(1, len(test_questions), eval_metrics, duration)

        progress = init_or_load_progress()
        progress['databases'][db_id].update({
            'status': 'done',
            'successful': execution_metrics['successful'],
            'failed': execution_metrics['failed'],
            'execution_rate': eval_metrics.get('execution_rate') if eval_metrics else None,
            'exact_match_rate': eval_metrics.get('exact_match_rate') if eval_metrics else None,
            'finished_at': datetime.now().isoformat(),
        })
        save_progress(progress)

        print(f"\n✅ Database '{db_id}' completed in {duration:.1f}s")
        print_benchmark_status(progress)
    except Exception as e:
        progress = init_or_load_progress()
        progress['databases'][db_id]['status'] = 'failed'
        save_progress(progress)
        print(f"\n❌ Database '{db_id}' failed: {e}")
        print(
            "💡 Retry while automatically resuming completed questions: "
            "python run_complete_nl2sql_pipeline.py "
            f"--pipeline {PIPELINE_TYPE} --run-db {db_id}"
        )
        raise


def aggregate_all_dbs() -> None:
    """Combine completed gold/prediction files and evaluate the full dev set."""
    progress = init_or_load_progress()
    per_db_root = PIPELINE_OUTPUT_DIR / 'per_db'
    agg_dir = PIPELINE_OUTPUT_DIR / 'full_dev'
    os.makedirs(agg_dir, exist_ok=True)

    gold_lines, pred_lines, missing = [], [], []
    for db in progress['db_order']:
        db_dir = per_db_root / db
        gold_f, pred_f = db_dir / 'gold.sql', db_dir / 'predict.sql'
        if gold_f.exists() and pred_f.exists():
            with open(gold_f, 'r', encoding='utf-8') as f:
                gold_lines.extend(f.readlines())
            with open(pred_f, 'r', encoding='utf-8') as f:
                pred_lines.extend(f.readlines())
        else:
            missing.append(db)

    if missing:
        print(f"⚠️  Databases without results: {missing}")

    agg_gold = agg_dir / 'gold.sql'
    agg_pred = agg_dir / 'predict.sql'
    with open(agg_gold, 'w', encoding='utf-8') as f:
        f.writelines(gold_lines)
    with open(agg_pred, 'w', encoding='utf-8') as f:
        f.writelines(pred_lines)

    print(f"📦 Combined {len(gold_lines)} gold/prediction pairs in {agg_dir}")
    if not setup_environment():
        print("❌ Environment setup failed")
        return
    eval_metrics = run_evaluation(agg_gold, agg_pred)
    if eval_metrics:
        print(
            f"\n🏁 FULL DEV-SET RESULTS ({PIPELINE_TYPE}): "
            f"EX={eval_metrics['execution_rate']:.1f}%  "
            f"EM={eval_metrics['exact_match_rate']:.1f}%"
        )


def main():
    """Run the complete pipeline."""
    global ai_request_count, execution_metrics, timing_metrics, api_call_details

    # Reset tracking variables
    ai_request_count = 0
    execution_metrics = {'total': 0, 'successful': 0, 'failed': 0}
    timing_metrics = {
        'setup_time': 0.0,
        'questions_loading_time': 0.0,
        'nl2sql_processing_time': 0.0,
        'conversion_time': 0.0,
        'evaluation_time': 0.0
    }
    api_call_details = {
        'per_question': [],
        'enhancement_calls': 0,
        'total_agent_calls': 0
    }

    # Parse command-line arguments.
    parser = argparse.ArgumentParser(
        description=(
            "Run the complete NL2SQL pipeline: 4step | 6step | "
            "5step_without_planner | 5step_without_refiner."
        )
    )
    parser.add_argument(
        "--pipeline",
        choices=[
            "4step",
            "6step",
            "5step_without_planner",
            "5step_without_refiner",
            "without_planner",
            "without_refiner",
            "5step_no_planner",
            "5step_no_refiner",
            "no_planner",
            "no_refiner",
        ],
        default="4step",
        help=(
            "Pipeline: 4step | 6step | 5step_without_planner | 5step_without_refiner "
            "(aliases: without_planner, without_refiner)."
        ),
    )
    parser.add_argument(
        "--num_questions",
        type=int,
        default=50,
        help=(
            "Number of Spider questions used to test the pipeline "
            "(default: 50; 0 = all questions in the database)."
        ),
    )
    parser.add_argument(
        "--db_id",
        type=str,
        default=None,
        help="Use a specific Spider database for fair comparisons across runs.",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=42,
        help="Random seed for sampling database questions (default: 42).",
    )
    # Full dev-set benchmark mode by database.
    parser.add_argument(
        "--next",
        action="store_true",
        help=(
            "Run all questions for the next incomplete database, then stop "
            "(benchmark mode)."
        ),
    )
    parser.add_argument(
        "--run-db",
        type=str,
        default=None,
        dest="run_db",
        help=(
            "Run all questions for a specific database in benchmark mode "
            "with automatic resume."
        ),
    )
    parser.add_argument(
        "--status",
        action="store_true",
        help="Print benchmark progress by database, then exit.",
    )
    parser.add_argument(
        "--aggregate",
        action="store_true",
        help="Combine completed database results and evaluate the full dev set.",
    )
    args = parser.parse_args()

    # Configure the selected pipeline.
    configure_pipeline(args.pipeline)

    # ==== Benchmark mode: run one database at a time ====
    if args.status:
        print_benchmark_status(init_or_load_progress())
        return

    if args.aggregate:
        aggregate_all_dbs()
        return

    if args.next or args.run_db:
        if args.run_db:
            target_db = args.run_db
        else:
            target_db = get_next_pending_db(init_or_load_progress())
            if target_db is None:
                print(
                    "🎉 All databases are complete. Use --aggregate to obtain "
                    "full dev-set results."
                )
                return
        run_single_db_benchmark(target_db)
        return

    print(f"🚀 Starting the complete NL2SQL pipeline ({args.pipeline})")
    print("=" * 60)

    start_time = time.time()

    # 1. Setup environment
    if not setup_environment():
        print("❌ Environment setup failed")
        return

    # 2. Get test questions using the command-line question count.
    test_questions = get_test_questions(
        num_questions=args.num_questions,
        db_id=args.db_id,
        seed=args.seed,
    )

    # 3. Run the NL2SQL system.
    csv_filename, results = run_nl2sql_system(test_questions)
    if not csv_filename:
        print("❌ NL2SQL system failed")
        return

    # 4. Convert format
    gold_file, predict_file = convert_csv_to_evaluation_format(csv_filename)

    # 5. Run evaluation.
    eval_metrics = run_evaluation(gold_file, predict_file)

    end_time = time.time()
    duration = end_time - start_time

    # 6. Print results table
    print_results_table(1, len(test_questions), eval_metrics, duration)

    print("\n📁 Generated files:")
    print(f"   - Results CSV: {csv_filename}")
    print(f"   - Gold SQL: {gold_file}")
    print(f"   - Predict SQL: {predict_file}")


if __name__ == "__main__":
    main()

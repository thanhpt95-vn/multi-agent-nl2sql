# multi-agent-nl2sql

Multi-agent Natural Language to SQL (NL2SQL) with [CrewAI](https://www.crewai.com/):

- **4-step baseline:** Analysis → Schema → Generation → Validation  
- **6-step proposed:** adds Query Planning + SQL Refinement

This public package is for **advisor / reproducibility review**: runnable code, Spider questions/schema, published predictions, per-question agent traces, and the Dr.Spider-340 diagnostic subset (IDs + predictions). Large Spider SQLite dumps are not vendored in git; download them separately (link below).

## Results snapshot

### Spider 1.0 Dev (1,034 questions, weighted over 20 DBs)

From `output/nl2sql_{4,6}step/benchmark_progress.json` (round-2 rerun, GPT-4o Analyzer on both pipelines):


| Pipeline      | EX (%) | EM (%) |
| ------------- | ------ | ------ |
| Single prompt |  79.0 |  49.6   |
| 4-step        | 84.9   | 57.4   |
| 6-step        | 84.9   | 73.6   |


> Re-run official `evaluation.py` on `full_dev` / `*_full` after installing Spider SQLite DBs for an end-to-end check.



### Dr.Spider-340 diagnostic subset (20 × 17 perturbations, post-perturbation)

From `output/drspider340/` (`exec_eval` EX):


| Pipeline | EX (%) | DB   | NLQ  | SQL  |
| -------- | ------ | ---- | ---- | ---- |
| 4-step   | 78.8   | 76.7 | 79.4 | 79.0 |
| 6-step   | 77.1   | 71.7 | 78.9 | 77.0 |




## Model assignment (local code)


| Stage             | 4-step           | 6-step           |
| ----------------- | ---------------- | ---------------- |
| Question Analyzer | GPT-4o           | GPT-4o           |
| Schema Selector   | Gemini 2.5 Flash | Gemini 2.5 Flash |
| Query Planner     | —                | GPT-4o           |
| SQL Expert        | GPT-4o           | GPT-4o           |
| SQL Refiner       | —                | GPT-4o           |
| SQL Validator     | Gemini 2.5 Flash | Gemini 2.5 Flash |


Configured in `src/nl2sql_{4,6}step/.../config/agents.yaml`.

## Repository layout

```text
src/nl2sql_4step/          # baseline pipeline
src/nl2sql_6step/          # proposed pipeline
run_complete_nl2sql_pipeline.py
data/                      # Spider dev.json, tables.json, questions.json
experiments/
  test-suite-sql-eval/     # official Spider eval scripts (no database/)
  round2/drspider/         # Dr.Spider-340 questions + gold JSON + sampler
output/                    # published gold/predict + progress/summaries
scripts/                   # setup / eval helpers + smoke runners
```



## Setup

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env   # add OPENAI_API_KEY / GEMINI_API_KEY / etc.
```

### Spider SQLite databases (not vendored in git)

Download the full Spider `database/` bundle (`spider_data.zip`) from Google Drive:

- [spider_data.zip](https://drive.google.com/file/d/19RYo6LWT6iaiLb4LtaR0cr6XBuAyWrJY/view?usp=sharing)

Then unpack and point the eval harness at the `database/` folder inside the archive:

```bash
# example: unzip to a local path, then sync into the eval tree
unzip spider_data.zip -d /path/to/spider_data
export SPIDER_DATABASE_DIR=/path/to/spider_data/database
./scripts/setup_spider_databases.sh
```

Expected layout after setup: `experiments/test-suite-sql-eval/database/<db_id>/<db_id>.sqlite`.

Dr.Spider full release (for re-running the 340 subset) must be downloaded separately from the official diagnostic-robustness-text-to-sql repository; paths are recorded in `experiments/round2/drspider/*.json`.

## Run / evaluate

```bash
# status of Spider per-DB benchmark
python run_complete_nl2sql_pipeline.py --pipeline 6step --status

# evaluate published Spider predictions
./scripts/eval_published_results.sh 4step
./scripts/eval_published_results.sh 6step

# Dr.Spider-340 smoke / full runner (needs local Dr.Spider DBs)
python scripts/smoke_test_drspider30.py --all --pipeline both --output-dir output/drspider340 --no-fresh
```



## What is intentionally not included

- Spider / Dr.Spider SQLite trees in git (Spider full DB: download [spider_data.zip](https://drive.google.com/file/d/19RYo6LWT6iaiLb4LtaR0cr6XBuAyWrJY/view?usp=sharing))  
- backups (`*.bak*`), IDE/agent memory, paper drafts, API keys

Per-question agent traces are included under `output/**/raw_responses/` (Spider 1,034 + Dr.Spider-340 for both pipelines).

## License

Code in this repository is released under the MIT License (see `LICENSE`).  
Spider and Dr.Spider datasets remain under their original licenses; obtain them from the official sources.
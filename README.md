# multi-agent-nl2sql

Multi-agent Natural Language to SQL (NL2SQL) with [CrewAI](https://www.crewai.com/):

- **4-step baseline:** Analysis → Schema → Generation → Validation  
- **5-step ablations:** reuse the 6-step pipeline while omitting either Query Planning or SQL Refinement
- **6-step proposed:** adds Query Planning + SQL Refinement

This public package is for **advisor / reproducibility review**: runnable code, Spider questions/schema, published predictions, and per-question agent traces. Large Spider SQLite dumps are not vendored in git; download them separately (link below).

## Results snapshot

### Spider 1.0 Dev (1,034 questions, weighted over 20 DBs)

Full Spider dev-set results for the single-prompt baseline and four multi-agent
pipeline configurations:


| Pipeline              | EX (%) | EM (%) |
| --------------------- | ------ | ------ |
| Single prompt         | 79.0   | 49.6   |
| 4-stage               | 84.9   | 57.4   |
| 5-stage w/o Planner   | 85.5   | 46.1   |
| 5-stage w/o Refiner   | 85.3   | 46.5   |
| 6-stage               | 89.0   | 75.0   |


> Re-run official `evaluation.py` on `full_dev` / `*_full` after installing Spider SQLite DBs for an end-to-end check.



## Model assignment (local code)

| Stage             | 4-stage          | 5-stage w/o Planner | 5-stage w/o Refiner | 6-stage          |
| ----------------- | ---------------- | ------------------- | ------------------- | ---------------- |
| Question Analyzer | GPT-4o           | GPT-4o              | GPT-4o              | GPT-4o           |
| Schema Selector   | Gemini 2.5 Flash | Gemini 2.5 Flash    | Gemini 2.5 Flash    | Gemini 2.5 Flash |
| Query Planner     | —                | —                   | Gemini 2.5 Flash    | Gemini 2.5 Flash |
| SQL Expert        | GPT-4o           | GPT-4o              | GPT-4o              | GPT-4o           |
| SQL Refiner       | —                | Gemini 2.5 Flash    | —                   | Gemini 2.5 Flash |
| SQL Validator     | Gemini 2.5 Flash | Gemini 2.5 Flash    | Gemini 2.5 Flash    | Gemini 2.5 Flash |

These are the default assignments in
`src/nl2sql_{4,6}step/.../config/agents.yaml`; environment variables can
override them.

## Repository layout

```text
src/nl2sql_4step/          # baseline pipeline
src/nl2sql_6step/          # proposed pipeline
run_complete_nl2sql_pipeline.py
data/                      # Spider dev.json, tables.json, questions.json
experiments/
  test-suite-sql-eval/     # official Spider eval scripts (no database/)
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

## Run / evaluate

### Run each of the four pipeline configurations

Use the same database, question count, and seed for a fair comparison. Replace
`world_1` with any Spider database ID:

```bash
# 4-stage baseline
python run_complete_nl2sql_pipeline.py \
  --pipeline 4step \
  --db_id world_1 \
  --num_questions 50 \
  --seed 42

# 5-stage ablation without Query Planner
python run_complete_nl2sql_pipeline.py \
  --pipeline 5step_without_planner \
  --db_id world_1 \
  --num_questions 50 \
  --seed 42

# 5-stage ablation without SQL Refiner
python run_complete_nl2sql_pipeline.py \
  --pipeline 5step_without_refiner \
  --db_id world_1 \
  --num_questions 50 \
  --seed 42

# 6-stage proposed pipeline
python run_complete_nl2sql_pipeline.py \
  --pipeline 6step \
  --db_id world_1 \
  --num_questions 50 \
  --seed 42
```

To run all four configurations sequentially with identical inputs:

```bash
for PIPELINE in \
  4step \
  5step_without_planner \
  5step_without_refiner \
  6step
do
  python run_complete_nl2sql_pipeline.py \
    --pipeline "$PIPELINE" \
    --db_id world_1 \
    --num_questions 50 \
    --seed 42
done
```

Set `--num_questions 0` to run every question from the selected database.
Results are written to separate directories:

| Pipeline argument              | Output directory                          |
| ------------------------------ | ----------------------------------------- |
| `4step`                        | `output/nl2sql_4step/`                    |
| `5step_without_planner`        | `output/nl2sql_5step/without_planner/`    |
| `5step_without_refiner`        | `output/nl2sql_5step/without_refiner/`    |
| `6step`                        | `output/nl2sql_6step/`                    |

### Run the full Spider dev-set benchmark

The full benchmark processes one database per invocation and automatically
resumes completed questions. Repeat `--next` until `--status` reports that all
databases are complete, then aggregate the results:

```bash
# Choose one of:
# 4step | 5step_without_planner | 5step_without_refiner | 6step
PIPELINE=6step

# Inspect progress
python run_complete_nl2sql_pipeline.py --pipeline "$PIPELINE" --status

# Run the next incomplete database; repeat until all databases are complete
python run_complete_nl2sql_pipeline.py --pipeline "$PIPELINE" --next

# Aggregate all completed databases and evaluate the full dev set
python run_complete_nl2sql_pipeline.py --pipeline "$PIPELINE" --aggregate
```

### Evaluate published predictions

```bash
./scripts/eval_published_results.sh 4step
./scripts/eval_published_results.sh 6step
```



## What is intentionally not included

- Spider SQLite trees in git (Spider full DB: download [spider_data.zip](https://drive.google.com/file/d/19RYo6LWT6iaiLb4LtaR0cr6XBuAyWrJY/view?usp=sharing))  
- backups (`*.bak*`), IDE/agent memory, paper drafts, API keys

Published per-question agent traces are included under
`output/**/raw_responses/`.

## License

Code in this repository is released under the MIT License (see `LICENSE`).  
Spider datasets remain under their original licenses; obtain them from the official sources.

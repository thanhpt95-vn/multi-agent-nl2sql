# Published run artifacts

This folder stores **evaluation inputs/outputs** for advisor review and reproducibility.
Large SQLite databases are **not** included. Per-question `raw_responses/` traces **are** included.

## Spider 1.0 development set (1,034 questions)

| Path | Contents |
| --- | --- |
| `nl2sql_4step/benchmark_progress.json` | Per-database EX/EM for the 4-step pipeline |
| `nl2sql_6step/benchmark_progress.json` | Per-database EX/EM for the 6-step pipeline |
| `nl2sql_{4,6}step/per_db/<db_id>/{gold,predict}.sql` | Official-eval format (`SQL\tdb_id`) |
| `nl2sql_{4,6}step/full_dev/{gold,predict}.sql` | Aggregated full-dev files when present |
| `nl2sql_{4,6}step_full/` | Flat published gold/predict/questions bundle |
| `gold_dev.sql`, `questions_dev.json` | Dev-set helpers |
| `nl2sql_{4,6}step/raw_responses/<db_id>/qXXXX.json` | Per-question agent traces (1,034 each) |

Re-evaluate (after placing Spider SQLite DBs):

```bash
./scripts/eval_published_results.sh 4step
./scripts/eval_published_results.sh 6step
```

## Dr.Spider-340 diagnostic subset

| Path | Contents |
| --- | --- |
| `drspider340/sample_manifest.json` | 340 sampled post-perturbation items (seed protocol) |
| `drspider340/smoke_summary_all.json` | 4-step vs 6-step EX summaries |
| `drspider340/{4step,6step}/{gold,predict}.sql` | Predictions for the 340-item run |
| `drspider340/{4step,6step}/ex_detail.json` | Per-sample EX flags |
| `drspider340/{4step,6step}/raw_responses/` | Per-question agent traces (340 each) |
| `../experiments/round2/drspider/` | Question/gold JSON + sampling script |

Dr.Spider SQLite files are **not** vendored (license/size). Reconstruct paths from
`database_relpath` in the JSON artifacts after downloading the official Dr.Spider release.

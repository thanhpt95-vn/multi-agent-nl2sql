#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
EVAL="$ROOT/experiments/test-suite-sql-eval"
PIPE="${1:-6step}"
GOLD="$ROOT/output/nl2sql_${PIPE}_full/gold.sql"
PRED="$ROOT/output/nl2sql_${PIPE}_full/predict.sql"
python "$EVAL/evaluation.py" \
  --gold "$GOLD" --pred "$PRED" \
  --db "$EVAL/database" --etype all \
  --table "$EVAL/tables.json" --plug_value

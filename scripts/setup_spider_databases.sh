#!/usr/bin/env bash
# Download / link Spider SQLite DBs into the official eval folder.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/experiments/test-suite-sql-eval/database"
echo "Place Spider database/ under: $TARGET"
echo "Expected layout: database/<db_id>/<db_id>.sqlite"
if [[ -d "${SPIDER_DATABASE_DIR:-}" ]]; then
  mkdir -p "$TARGET"
  rsync -a "$SPIDER_DATABASE_DIR/" "$TARGET/"
  echo "Synced from SPIDER_DATABASE_DIR=$SPIDER_DATABASE_DIR"
else
  echo "Set SPIDER_DATABASE_DIR to your local Spider database root, then re-run."
  exit 1
fi

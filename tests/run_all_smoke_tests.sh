#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
count=0

while IFS= read -r -d '' smoke; do
  echo "Running $smoke"
  bash "$smoke"
  count=$((count + 1))
done < <(find "$ROOT/articles" -path "*/calculators/run_calculator_smoke_tests.sh" -print0 | sort -z)

echo "Completed $count calculator smoke test scripts."

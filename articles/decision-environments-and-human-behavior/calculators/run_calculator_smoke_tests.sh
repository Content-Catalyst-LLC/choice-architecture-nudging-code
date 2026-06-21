#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if command -v python3 >/dev/null 2>&1; then
  python3 "$DIR/python/choice_architecture_calculator.py" >/dev/null
  test -f "$DIR/outputs/python_choice_summary.json"
else
  echo "python3 not found; skipping Python calculator."
fi

if command -v Rscript >/dev/null 2>&1; then
  Rscript "$DIR/r/choice_architecture_calculator.R" >/dev/null
  test -f "$DIR/outputs/r_choice_summary.csv"
else
  echo "Rscript not found; skipping R calculator."
fi

echo "Calculator smoke tests passed for $DIR"

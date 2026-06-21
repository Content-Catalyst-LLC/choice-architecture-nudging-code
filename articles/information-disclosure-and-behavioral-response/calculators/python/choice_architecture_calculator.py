#!/usr/bin/env python3
"""
Educational choice architecture calculator.

Synthetic, self-contained, no external dependencies.
"""

from __future__ import annotations

import json
import math
from pathlib import Path
from typing import Dict


def logistic(x: float) -> float:
    return 1.0 / (1.0 + math.exp(-x))


def choice_probability(
    perceived_value: float = 0.65,
    default_status: float = 1.0,
    salience: float = 0.6,
    friction: float = 0.25,
    trust: float = 0.7,
    social_norm_signal: float = 0.45,
    comprehension: float = 0.8,
) -> float:
    """Return a synthetic probability of choosing an option."""
    z = (
        -2.15
        + 1.35 * perceived_value
        + 0.85 * default_status
        + 0.55 * salience
        - 1.45 * friction
        + 0.80 * trust
        + 0.55 * social_norm_signal
        + 0.65 * comprehension
    )
    return logistic(z)


def default_effect() -> Dict[str, float]:
    with_default = choice_probability(default_status=1.0)
    without_default = choice_probability(default_status=0.0)
    return {
        "with_default": with_default,
        "without_default": without_default,
        "default_effect": with_default - without_default,
    }


def friction_completion_probability(friction: float = 0.4, sensitivity: float = 1.2) -> float:
    """Return a synthetic completion probability that declines as friction rises."""
    return math.exp(-sensitivity * friction)


def main() -> None:
    output_dir = Path(__file__).resolve().parents[1] / "outputs"
    output_dir.mkdir(parents=True, exist_ok=True)

    summary = {
        "choice_probability": choice_probability(),
        "default_effect": default_effect(),
        "friction_completion_probability": friction_completion_probability(),
        "ethics_note": "Synthetic educational calculator; evaluate transparency, autonomy, reversibility, and equity before real use.",
    }

    out_path = output_dir / "python_choice_summary.json"
    out_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()

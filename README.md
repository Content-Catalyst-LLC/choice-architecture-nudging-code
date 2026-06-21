# Choice Architecture and Nudging Code

Computational companion repository for the **Choice Architecture and Nudging** knowledge series from Sustainable Catalyst / Content Catalyst LLC.

This repository supports the article map at:

- https://sustainablecatalyst.com/choice-architecture-and-nudging/

The series examines defaults, opt-ins, opt-outs, salience, simplification, ordering, friction, prompts, reminders, feedback, social norm nudges, boosts, digital interfaces, public-policy nudging, administrative burden, dark patterns, algorithmic choice architecture, measurement, ethics, and the governance of behavioral influence.

## Repository structure

```text
articles/
  <article-slug>/
    calculators/
    data/
    docs/
    notebooks/
    outputs/
    python/
    r/
    julia/
    sql/
    haskell/
    rust/
    go/
    c/
    cpp/
    fortran/
    java/
    typescript/
    prolog/
_shared/
datasets/
docs/
notebooks/
outputs/
scripts/
tests/
canvas/
```

## Design principles

- Use synthetic data unless a real public dataset is explicitly documented.
- Make assumptions visible.
- Treat decision environments as ethically consequential.
- Separate behavioral support from manipulation.
- Include calculators and smoke tests for every article folder.
- Preserve reproducibility through manifests, scripts, schemas, and outputs.

## Quick smoke test

```bash
bash tests/run_all_smoke_tests.sh
```

Generated or upgraded by `setup_choice_architecture_nudging_repo.sh`.

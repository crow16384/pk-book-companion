# Companion R code — *Clinical Pharmacokinetics: Mathematics, Statistics, and Modeling*

Executable R code for the book **Clinical Pharmacokinetics: Mathematics,
Statistics, and Modeling — From First Principles to Modern Pharmacometrics**
by Vladimir Larchenko. One plain `.R` script per chapter, extracted from the
book sources together with the example datasets, so every analysis in the
book can be reproduced independently.

## Quick start

```sh
Rscript run_all.R                        # all chapters, in book order
Rscript code/12-oral-administration.R    # a single chapter
```

Run scripts from the repository root: chapters load `data/` with relative
paths. No book text is included here — see the book itself.

To recreate the verification environment exactly:

```r
install.packages("renv")
renv::restore()   # installs the package versions pinned in renv.lock
```

## Layout

```
code/      one R script per chapter/appendix (generated; see code/README.md)
R/         setup.R — package preflight used by the chapters
data/      example CSV datasets, their seeded generator, and a data
           dictionary (data/README.md)
run_all.R  executes every chapter script in book order
renv.lock  package versions pinned for reproducible restores
LICENSE    Creative Commons Attribution 4.0 International
```

## Verification environment

| Component | Version |
|-----------|---------|
| R | 4.6.1 (2026-06-24) |
| deSolve | 1.42 |
| rxode2 | 5.1.7.1 |
| PKNCA | 0.12.1 |
| nlmixr2 | 7.0.1 |
| mrgsolve | 2.0.1 |
| ggplot2 | 4.0.3 |
| dplyr | 1.2.1 |
| tidyr | 1.3.2 |
| readr | 2.2.0 |
| tibble | 3.3.1 |
| here | 1.0.2 |

## Reproducibility

All simulations use fixed random seeds declared in the scripts themselves.
`renv.lock` pins the package versions; the verification-environment table
below records the versions the code was last run against.

## License

This work is licensed under the Creative Commons Attribution 4.0
International License (CC BY 4.0). To view a copy of this license, visit
<https://creativecommons.org/licenses/by/4.0/> or see the LICENSE file.

© Vladimir Larchenko. When reusing this code, please attribute:
*Clinical Pharmacokinetics: Mathematics, Statistics, and Modeling —
Companion R Code* by Vladimir Larchenko.


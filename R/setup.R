# Shared package setup for Clinical Pharmacokinetics book
# Source from chapters as needed: source(here::here("R", "setup.R"))

pk_packages <- c(
  "ggplot2",
  "dplyr",
  "tidyr",
  "readr",
  "deSolve",
  "rxode2",
  "PKNCA",
  "nlmixr2",
  "mrgsolve"
)

for (pkg in pk_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message("Package not installed: ", pkg)
  }
}

# Sensible defaults for reproducible figures
set.seed(20260731)
options(digits = 4)

theme_pk <- function(base_size = 12) {
  ggplot2::theme_bw(base_size = base_size) +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank(),
      legend.position = "bottom"
    )
}

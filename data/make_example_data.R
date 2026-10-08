# Generate synthetic PK datasets used in later chapters
suppressPackageStartupMessages({
  library(dplyr)
})

set.seed(20260731)

# Single-subject IV bolus for NCA / estimation demos
time <- c(0, 0.25, 0.5, 1, 2, 4, 6, 8, 12, 24)
k <- 0.15
V <- 20
dose <- 100
conc_true <- (dose / V) * exp(-k * time)
conc <- pmax(conc_true * exp(rnorm(length(time), 0, 0.08)), 0.01)

pk_iv <- data.frame(
  USUBJID = "101",
  TIME = time,
  CONC = round(conc, 3),
  DOSE = dose,
  ROUTE = "IV"
)

# Small multi-subject oral dataset (one-compartment Bateman)
n_subj <- 12
subj <- sprintf("%03d", 1:n_subj)
ka <- exp(rnorm(n_subj, log(1.2), 0.25))
kel <- exp(rnorm(n_subj, log(0.18), 0.2))
Vd <- exp(rnorm(n_subj, log(25), 0.15))
F <- 0.7
oral_dose <- 100
tgrid <- c(0, 0.5, 1, 1.5, 2, 3, 4, 6, 8, 12, 24)

pk_oral <- do.call(rbind, lapply(seq_along(subj), function(i) {
  C <- F * oral_dose / Vd[i] * ka[i] / (ka[i] - kel[i]) *
    (exp(-kel[i] * tgrid) - exp(-ka[i] * tgrid))
  C <- pmax(C * exp(rnorm(length(tgrid), 0, 0.1)), 0.005)
  data.frame(
    USUBJID = subj[i],
    TIME = tgrid,
    CONC = round(C, 4),
    DOSE = oral_dose,
    WT = round(rnorm(1, 70, 8), 1),
    SEX = sample(c("M", "F"), 1)
  )
}))

write.csv(pk_iv, file.path("data", "pk_iv_bolus.csv"), row.names = FALSE)
write.csv(pk_oral, file.path("data", "pk_oral_multi.csv"), row.names = FALSE)

message("Wrote data/pk_iv_bolus.csv and data/pk_oral_multi.csv")

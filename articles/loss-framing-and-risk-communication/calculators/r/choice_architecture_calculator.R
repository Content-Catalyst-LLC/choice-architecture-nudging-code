#!/usr/bin/env Rscript

# Educational choice architecture calculator.
# Synthetic, self-contained, base R only.

logistic <- function(x) {
  1 / (1 + exp(-x))
}

choice_probability <- function(
  perceived_value = 0.65,
  default_status = 1.0,
  salience = 0.6,
  friction = 0.25,
  trust = 0.7,
  social_norm_signal = 0.45,
  comprehension = 0.8
) {
  z <- -2.15 +
    1.35 * perceived_value +
    0.85 * default_status +
    0.55 * salience -
    1.45 * friction +
    0.80 * trust +
    0.55 * social_norm_signal +
    0.65 * comprehension

  logistic(z)
}

friction_completion_probability <- function(friction = 0.4, sensitivity = 1.2) {
  exp(-sensitivity * friction)
}

with_default <- choice_probability(default_status = 1.0)
without_default <- choice_probability(default_status = 0.0)

summary <- data.frame(
  metric = c(
    "choice_probability",
    "with_default",
    "without_default",
    "default_effect",
    "friction_completion_probability"
  ),
  value = c(
    choice_probability(),
    with_default,
    without_default,
    with_default - without_default,
    friction_completion_probability()
  )
)

args <- commandArgs(trailingOnly = FALSE)
file_arg <- "--file="
script_path <- sub(file_arg, "", args[grep(file_arg, args)])
if (length(script_path) == 0) {
  script_path <- "choice_architecture_calculator.R"
}
script_path <- normalizePath(script_path)
output_dir <- file.path(dirname(dirname(script_path)), "outputs")
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

write.csv(summary, file.path(output_dir, "r_choice_summary.csv"), row.names = FALSE)
print(summary)

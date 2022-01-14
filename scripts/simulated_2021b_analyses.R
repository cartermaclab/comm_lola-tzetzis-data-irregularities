library(ggplot2)
library(dplyr)
library(tidyr)
library(faux)

# set seed for reproducible simulation results
set.seed(9293)

### reaction time data

# create data for each group at 4 correlated time points. sample from distributions
# with mean and sd reported in original data table.

implicit_or <- rnorm_multi(n = 15,
                   mu = c(831.12, 574.27, 587.48, 595.73),
                   sd = c(10.25, 8.37, 9.84, 11.05),
                   r = .8,
                   varnames = c("A", "B", "C", "D"),
                   empirical = FALSE)

analogy_or <- rnorm_multi(n = 15,
                          mu = c(840.23, 485.26, 479.68, 490.51),
                          sd = c(11.39, 9.63, 9.49, 10.26),
                          r = .8,
                          varnames = c("A", "B", "C", "D"),
                          empirical = FALSE)

explicit_or <- rnorm_multi(n = 15,
                           mu = c(838.17, 715.24, 742.14, 950.27),
                           sd = c(12.25, 10.24, 11.13, 13.24),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

control_or <- rnorm_multi(n = 15,
                          mu = c(841.58, 828.15, 839.19, 958.56),
                          sd = c(10.46, 11.34, 10.95, 12.47),
                          r = .8,
                          varnames = c("A", "B", "C", "D"),
                          empirical = FALSE)


original_dat <- gdata::combine(implicit_or, analogy_or, explicit_or, control_or)

# conduct 4 X 4 mixed anova with simulated data

jmv::anovaRM(
  data = original_dat,
  rm = list(
    list(label = "phase_id",
         levels = c("A", "B", "C", "D"))
  ),
  rmCells = list(
    list(measure = "A", cell = "A"),
    list(measure = "B", cell = "B"),
    list(measure = "C", cell = "C"),
    list(measure = "D", cell = "D")
  ),
  bs = source,
  rmTerms = ~ phase_id,
  bsTerms = ~source,
  effectSize = "ges",
  #spherCorr = "GG"
)


# create data using meand and standard deviations from UPDATED tables

implicit_new <- rnorm_multi(n = 15,
                           mu = c(831.12, 574.27, 587.48, 595.73),
                           sd = c(102.51, 83.74, 98.37, 110.46),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

analogy_new <- rnorm_multi(n = 15,
                          mu = c(840.23, 485.26, 479.68, 490.51),
                          sd = c(113.85, 96.39, 94.92, 102.6),
                          r = .8,
                          varnames = c("A", "B", "C", "D"),
                          empirical = FALSE)

explicit_new <- rnorm_multi(n = 15,
                           mu = c(838.17, 715.24, 742.14, 950.27),
                           sd = c(122.48, 102.43, 111.3, 132.36),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

control_new <- rnorm_multi(n = 15,
                          mu = c(841.58, 828.15, 839.19, 958.56),
                          sd = c(104.6, 113.41, 109.52, 124.67),
                          r = .8,
                          varnames = c("A", "B", "C", "D"),
                          empirical = FALSE)


new_dat <- gdata::combine(implicit_new, analogy_new, explicit_new, control_new)

# conduct 4 X 4 mixed anova with simulated data

jmv::anovaRM(
  data = new_dat,
  rm = list(
    list(label = "phase_id",
         levels = c("A", "B", "C", "D"))
  ),
  rmCells = list(
    list(measure = "A", cell = "A"),
    list(measure = "B", cell = "B"),
    list(measure = "C", cell = "C"),
    list(measure = "D", cell = "D")
  ),
  bs = source,
  rmTerms = ~ phase_id,
  bsTerms = ~source,
  effectSize = "ges",
  #spherCorr = "GG"
)

### perceptual accuracy data

# create data for each group at 4 correlated time points. sample from distributions
# with mean and sd reported in original data table.

implicit_orp <- rnorm_multi(n = 15,
                           mu = c(36.41, 68.28, 67.83, 67.01),
                           sd = c(2.59, 3.57, 3.93, 4.55),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

analogy_orp <- rnorm_multi(n = 15,
                          mu = c(35.67, 79.76, 80.35, 79.51),
                          sd = c(3.21, 4.10, 4.35, 5.64),
                          r = .8,
                          varnames = c("A", "B", "C", "D"),
                          empirical = FALSE)

explicit_orp <- rnorm_multi(n = 15,
                           mu = c(34.78, 55.24, 54.56, 41.77),
                           sd = c(2.96, 3.82, 3.97, 4.53),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

control_orp <- rnorm_multi(n = 15,
                          mu = c(35.37, 34.56, 35.84, 31.54),
                          sd = c(2.76, 2.47, 2.91, 3.58),
                          r = .8,
                          varnames = c("A", "B", "C", "D"),
                          empirical = FALSE)

original_dat_p <- gdata::combine(implicit_orp, analogy_orp, explicit_orp, control_orp)

# conduct 4 X 4 mixed anova with simulated data

jmv::anovaRM(
  data = original_dat_p,
  rm = list(
    list(label = "phase_id",
         levels = c("A", "B", "C", "D"))
  ),
  rmCells = list(
    list(measure = "A", cell = "A"),
    list(measure = "B", cell = "B"),
    list(measure = "C", cell = "C"),
    list(measure = "D", cell = "D")
  ),
  bs = source,
  rmTerms = ~ phase_id,
  bsTerms = ~source,
  effectSize = "ges",
  #spherCorr = "GG"
)


# create data using meand and standard deviations from UPDATED tables

implicit_newp <- rnorm_multi(n = 15,
                            mu = c(36.41, 68.28, 67.83, 67.01),
                            sd = c(10.03, 13.83, 15.22, 17.62),
                            r = .8,
                            varnames = c("A", "B", "C", "D"),
                            empirical = FALSE)

analogy_newp <- rnorm_multi(n = 15,
                           mu = c(35.67, 79.76, 80.35, 79.51),
                           sd = c(12.43, 15.88, 16.85, 21.84),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

explicit_newp <- rnorm_multi(n = 15,
                            mu = c(34.78, 55.24, 54.56, 41.77),
                            sd = c(11.46, 14.79, 15.38, 17.54),
                            r = .8,
                            varnames = c("A", "B", "C", "D"),
                            empirical = FALSE)

control_newp <- rnorm_multi(n = 15,
                           mu = c(35.37, 34.56, 35.84, 31.54),
                           sd = c(10.69, 9.57, 11.27, 13.87),
                           r = .8,
                           varnames = c("A", "B", "C", "D"),
                           empirical = FALSE)

new_dat_p <- gdata::combine(implicit_newp, analogy_newp, explicit_newp, control_newp)

# conduct 4 X 4 mixed anova with simulated data

jmv::anovaRM(
  data = new_dat_p,
  rm = list(
    list(label = "phase_id",
         levels = c("A", "B", "C", "D"))
  ),
  rmCells = list(
    list(measure = "A", cell = "A"),
    list(measure = "B", cell = "B"),
    list(measure = "C", cell = "C"),
    list(measure = "D", cell = "D")
  ),
  bs = source,
  rmTerms = ~ phase_id,
  bsTerms = ~source,
  effectSize = "ges",
  #spherCorr = "GG"
)

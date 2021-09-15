# Effect size simulations for commentary on Lola and Tzetzis papers
#
# Created by Brad McKay
# Cleaned by Mike Carter

# SCRIPT SETUP ---------------
#
# Required libraries
library(ggplot2)
library(gridGraphics)
library(lsr)

# Set seed for simulations
set.seed(9293)

# Number of simulated experiments to run
iters <- 1000000


# SIMULATION 1 (d = 0.8) ---------------
#
# Store Cohen's d estimate from each simulated experiment
sim1_d <- rep(NA, iters)

# Run simulation
for (i in 1:iters) {
  x1 <- rnorm(n = 20, mean = 0, sd = 1)
  x2 <- rnorm(n = 20, mean = 0.8, sd = 1)
  sim1_res <- lsr::cohensD(x1, x2)
  sim1_d[i] <- sim1_res
}

# Calculate key values and round to 2 digits
round(max(sim1_d), digits = 2)
round(mean(sim1_d), digits = 2)


# SIMULATION 2 (d = 3) ---------------
#
# Store Cohen's d estimate from each simulated experiment
sim2_d <- rep(NA, iters)

# Run simulation
for (i in 1:iters) {
  x3 <- rnorm(n = 20, mean = 0, sd = 1)
  x4 <- rnorm(n = 20, mean = 3, sd = 1)
  sim2_res <- lsr::cohensD(x3, x4)
  sim2_d[i] <- sim2_res
}

# Calculate key values and round to 2 digits
round(max(sim2_d), digits = 2)
round(mean(sim2_d), digits = 2)
round(min(sim2_d), digits = 2)

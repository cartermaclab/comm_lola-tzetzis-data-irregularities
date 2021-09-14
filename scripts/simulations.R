# Effect size simulations for commentary on Lola and Tzetzis papers
#
# Created by Brad McKay
# Cleaned by Mike Carter

# SCRIPT SETUP ---------------
#
# Required libraries
library(cowplot)
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


# CREATE FIGURES AND COMBINE INTO SINGLE PLOT ---------------
#
# Create figure for simulation 1
sim1_dres <- stats::density(sim1_d)
sim1_fig <- graphics::plot(sim1_dres,
                           xlab = expression("Cohen's "*italic(d)),
                           bty = "n",
                           main = expression(italic('d') == .80)) +
  graphics::polygon(sim1_dres, col = "blue", border = "black")

p1_recorded <- grDevices::recordPlot(sim1_fig)
cowplot::ggdraw(p1_recorded)

# Create figure for simulation 2
sim2_dres <- stats::density(sim2_d)
sim2_fig <- graphics::plot(sim2_dres,
                           xlab = expression("Cohen's "*italic(d)),
                           bty = "n",
                           main = expression(italic('d') == 3.0)) +
  graphics::polygon(sim2_dres, col = "blue", border = "black")

p2_recorded <- grDevices::recordPlot(sim2_fig)
cowplot::ggdraw(p2_recorded)

# Combine figures
cowplot::plot_grid(p1_recorded, p2_recorded, labels = c('A', 'B'),
                   label_size = 12)

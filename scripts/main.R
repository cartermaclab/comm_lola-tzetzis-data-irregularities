# Main R script file for commentary on Lola and Tzetzis papers
#
# Created by Brad McKay
# Cleaned by Mike Carter

# SCRIPT SETUP ---------------
#
# Required libraries
library(lemon)
library(RColorBrewer)
library(scales)
library(tidyverse)

# Source article specific data wrangling scripts
source("scripts/wrangle_2012.R")
source("scripts/wrangle_2015.R")
source("scripts/wrangle_2020.R")
source("scripts/wrangle_2021.R")

# DATA WRANGLING ---------------
#
# Combine all effect sizes across experiments
all_effects <- plyr::rbind.fill(perceptual_2021,
                                anxiety_2021,
                                motor_2021,
                                rt_2021,
                                motorperf_2020,
                                selfefficacy_2020,
                                accuracy_2015,
                                rt_2015,
                                accuracy_2012,
                                rt_2012)

# Change to long format
all_long <- all_effects %>%
  tidyr::pivot_longer(!id, names_to = "comparison", values_to = "d")

# Make all d vaues positive
all_long$d <- abs(all_long$d)


# CREATE FIGURE ---------------
#
# Prevent scientific notation
options(scipen = 999)

# Plot of all effect sizes
ggplot2::ggplot(data = all_long,
                               aes(x = id,
                                   y = d,
                                   color = comparison)) +
  labs(y = expression(bold("Cohen's ") * bolditalic(d)),
       x = "Timepoint",
       color = "Comparison") +
  theme(
    panel.border = element_blank(),
    axis.line = element_line(),
    axis.ticks = element_line(),
    panel.background = element_rect(fill = "white")
  ) +
  scale_y_continuous(trans = "log10",
                     breaks = c(.2, .5, .8, 3, 10, 100, 1000, 4000)) +
  geom_jitter(width = .2) +
  annotate(
    "rect",
    xmin = 0.8,
    xmax = 4.2,
    ymin = 0,
    ymax = 2.97,
    alpha = .2,
    fill = "#1B9E77"
  ) +
  annotate(
    "rect",
    xmin = 0.8,
    xmax = 4.2,
    ymin = 1.36,
    ymax = 6.86,
    fill = "#7570B3",
    alpha = .2
  ) +
  scale_x_continuous(
    breaks = c(1, 2, 3, 4),
    labels = c(
      "1" = "Pre-test",
      "2" = "Post-test",
      "3" = "Retention",
      "4" = "Stress-test"
    )
  ) +
  scale_color_brewer(
    labels = c(
      "Analogy-Control",
      "Analogy-Implicit",
      "Explicit-Analogy",
      "Explicit-Control",
      "Explicit-Sequential",
      "Implicit-Control",
      "Implicit-Explicit",
      "Implicit-Sequential",
      "Sequential-Control"
    ),
    palette = "Set1"
  ) +
  theme(axis.title.x = element_text(face = "bold")) +
  theme(axis.title.y = element_text(face = "bold")) +
  theme(legend.title = element_text(face = "bold")) +
  lemon::coord_capped_cart(bottom = brackets_horizontal()) +
  geom_hline(aes(yintercept = 0.8), linetype = 'dashed') +
  annotate("text",
           x = 2.5,
           y = .5,
           label = "Cohen's benchmark\nfor a large effect")

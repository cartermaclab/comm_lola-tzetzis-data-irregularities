# Data wrangling for Lola & Tzetzis 2020
#
# Lola, A.C., & Tzetzis, G.C. (2020). Analogy versus explicit and implicit
# learning of a volleyball skill for novices: The effect on motor performance
# and self-efficacy. Journal of Physical Education and Sport, 20(5), 2478-2486.
# https://doi.org/10.7752/jpes.2020.05339
#
# Created by Brad McKay
# Cleaned by Mike Carter

# SCRIPT SETUP ---------------
#
# Required libraries
library(compute.es)
library(daff)
library(tidyverse)

# Load data files
#
# Brad's extraction for motor performance and self-efficacy
bm_2020_performance <- readr::read_csv("data/brad/2020/data_mp.csv")
bm_2020_selfefficacy <- readr::read_csv("data/brad/2020/data_se.csv")

# Abbey's extraction for motor performance and self-efficacy
ac_2020_performance <- readr::read_csv("data/abbey/2020/data_mp.csv")
ac_2020_selfefficacy <- readr::read_csv("data/abbey/2020/data_se.csv")


# EXTRACTION COMPARISONS ---------------
#
# Compare Brad's and Abbey's extractions for performance data
performance_diff <- daff::diff_data(bm_2020_performance, ac_2020_performance)
daff::render_diff(performance_diff)

#>>> Outcome of diff: Extractions match

# Use Brad's extraction for the main motor performance variable
main_2020_performance <- bm_2020_performance

# Compare Brad's and Abbey's extractions for self-efficacy data
selfefficacy_diff <- daff::diff_data(bm_2020_selfefficacy,
                                     ac_2020_selfefficacy)
daff::render_diff(selfefficacy_diff)

#>>> Outcome of diff: Extractions match

# Use Brad's extraction for the main motor performance variable
main_2020_selfefficacy <- bm_2020_selfefficacy


# EFFECT SIZE CALCULATIONS ---------------
#
# Motor performance data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2020_performance)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2020_performance)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2020_performance)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2020_performance)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2020_performance)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2020_performance)
I_C <- I_C$d

id <- main_2020_performance$id

# Create data frame of motor performance effect sizes for 2020 paper
motorperf_2020 <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
motorperf_2020 <- as.data.frame(motorperf_2020)


# Self-efficacy data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2020_selfefficacy)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2020_selfefficacy)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2020_selfefficacy)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2020_selfefficacy)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2020_selfefficacy)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2020_selfefficacy)
I_C <- I_C$d

id <- main_2020_selfefficacy$id

# Create data frame of self-efficacy effect sizes for 2020 paper
selfefficacy_2020 <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
selfefficacy_2020 <- as.data.frame(selfefficacy_2020)

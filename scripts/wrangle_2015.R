# Data wrangling for Tzetzis & Lola 2015
#
# Tzetzis, G.C., & Lola, A.C. (2015). The effect of analogy, implicit, and
# explicit learning on anticipation in volleyball serving. International
# Journal of Sport Psychology, 46(2), 152-166.
# https://doi.org/10.7352/IJSP.2015.46.152
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
# Brad's extraction for accuracy and response time data
bm_2015_accuracy <- readr::read_csv("data/brad/2015/data_ac.csv")
bm_2015_rt <- readr::read_csv("data/brad/2015/data_rt.csv")

# Abbey's extraction for accuracy and response time data
ac_2015_accuracy <- readr::read_csv("data/abbey/2015/data_ac.csv")
ac_2015_rt <- readr::read_csv("data/abbey/2015/data_rt.csv")


# EXTRACTION COMPARISONS ---------------
#
# Compare Brad's and Abbey's extractions for accuracy data
accuracy_diff <- daff::diff_data(bm_2015_accuracy, ac_2015_accuracy)
daff::render_diff(accuracy_diff)

#>>> Outcome of diff: Extractions match

# Use Brad's extraction for the main response time variable
main_2015_accuracy <- bm_2015_accuracy

# Compare Brad's and Abbey's extractions for response time data
rt_diff <- daff::diff_data(bm_2015_rt, ac_2015_rt)
daff::render_diff(rt_diff)

#>>> Outcome of diff: Abbey's extraction contained an error on explicit mean
#>>> at post test.

# Use Brad's extraction for the main response time variable
main_2015_rt <- bm_2015_rt


# EFFECT SIZE CALCULATIONS ---------------
#
# Accuracy data
A_I <- compute.es::mes(I_m, A_m, I_sd, A_sd, n, n,
                       id = id, data = main_2015_accuracy)
A_I <- A_I$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2015_accuracy)
I_E <- I_E$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2015_accuracy)
I_C <- I_C$d

E_A <- compute.es::mes(A_m, E_m, A_sd, E_sd, n, n,
                       id = id, data = main_2015_accuracy)
E_A <- E_A$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2015_accuracy)
A_C <- A_C$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2015_accuracy)
E_C <- E_C$d

id <- main_2015_accuracy$id

# Create data frame of accuracy effect sizes for 2015 paper
accuracy_2015 <- cbind(A_I, I_E, I_C, E_A, A_C, E_C, id)
accuracy_2015 <- as.data.frame(accuracy_2015)


# Response time data
A_I <- compute.es::mes(I_m, A_m, I_sd, A_sd, n, n,
                       id = id, data = main_2015_rt)
A_I <- A_I$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2015_rt)
I_E <- I_E$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2015_rt)
I_C <- I_C$d

E_A <- compute.es::mes(A_m, E_m, A_sd, E_sd, n, n,
                       id = id, data = main_2015_rt)
E_A <- E_A$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2015_rt)
A_C <- A_C$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2015_rt)
E_C <- E_C$d

id <- main_2015_rt$id

# Create data frame of RT effect sizes for 2012 paper
rt_2015 <- cbind(A_I, I_E, I_C, E_A, A_C, E_C, id)
rt_2015 <- as.data.frame(rt_2015)

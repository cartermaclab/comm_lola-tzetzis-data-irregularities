# Data wrangling for Lola et al 2012
#
# Lola, A.C., & Tzetzis, G.C., & Zetou, H. (2012). The effect of implicit and
# explicit practice in the development of decision making in volleyball
# serving. Perceptual and Motor Skills, 114(2), 665-678.
# https://doi.org/10.2466/05.23.25.PMS.114.2.665-678
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
bm_2012_accuracy <- readr::read_csv("data/brad/2012/data_ac.csv")
bm_2012_rt <- readr::read_csv("data/brad/2012/data_rt.csv")

# Abbey's extraction for accuracy and response time data
ac_2012_accuracy <- readr::read_csv("data/abbey/2012/data_ac.csv")
ac_2012_rt <- readr::read_csv("data/abbey/2012/data_rt.csv")


# EXTRACTION COMPARISONS ---------------
#
# Compare Brad's and Abbey's extractions for accuracy data
accuracy_diff <- daff::diff_data(bm_2012_accuracy, ac_2012_accuracy)
daff::render_diff(accuracy_diff)

#>>> Outcome of diff: Brad's extraction contained an error on explicit
#>>> pre-test mean.

# Use Abbey's extraction for the main accuracy variable
main_2012_accuracy <- ac_2012_accuracy

# Compare Brad's and Abbey's extractions for response time data
rt_diff <- daff::diff_data(bm_2012_rt, ac_2012_rt)
daff::render_diff(rt_diff)

#>>> Outcome of diff: Extractions match

# Use Brad's extraction for the main response time variable
main_2012_rt <- bm_2012_rt


# EFFECT SIZE CALCULATIONS ---------------
#
# Accuracy data
I_E <- compute.es::mes(E_m, I_m, E_sd, I_sd, n, n,
                       id = id, data = main_2012_accuracy)
I_E <- I_E$d

E_S <- compute.es::mes(E_m, S_m, E_sd, S_sd, n, n,
                       id = id, data = main_2012_accuracy)
E_S <- E_S$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2012_accuracy)
E_C <- E_C$d

I_S <- compute.es::mes(I_m, S_m, I_sd, S_sd, n, n,
                       id = id, data = main_2012_accuracy)
I_S <- I_S$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2012_accuracy)
I_C <- I_C$d

S_C <- compute.es::mes(S_m, C_m, S_sd, C_sd, n, n,
                       id = id, data = main_2012_accuracy)
S_C <- S_C$d

id <- main_2012_accuracy$id

# Create data frame of accuracy effect sizes for 2012 paper
accuracy_2012 <- cbind(I_E, E_S, E_C, I_S, I_C, S_C, id)
accuracy_2012 <- as.data.frame(accuracy_2012)


# Response time data
I_E <- compute.es::mes(E_m, I_m, E_sd, I_sd, n, n,
                       id = id, data = main_2012_rt)
I_E <- I_E$d

E_S <- compute.es::mes(E_m, S_m, E_sd, S_sd, n, n,
                       id = id, data = main_2012_rt)
E_S <- E_S$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2012_rt)
E_C <- E_C$d

I_S <- compute.es::mes(I_m, S_m, I_sd, S_sd, n, n,
                       id = id, data = main_2012_rt)
I_S <- I_S$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2012_rt)
I_C <- I_C$d

S_C <- compute.es::mes(S_m, C_m, S_sd, C_sd, n, n,
                       id = id, data = main_2012_rt)
S_C <- S_C$d

id <- main_2012_rt$id

# Create data frame of RT effect sizes for 2012 paper
rt_2012 <- cbind(I_E, E_S, E_C, I_S, I_C, S_C, id)
rt_2012 <- as.data.frame(rt_2012)

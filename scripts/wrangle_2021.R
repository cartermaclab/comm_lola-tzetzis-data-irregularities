# Data wrangling for Lola & Tzetzis 2021
#
# Lola, A.C., & Tzetzis, G.C. (2021). The effect of explicit, implicit and
# analogy instruction on decision making skill for novices, under stress.
# International Journal of Sport and Exercise Psychology, 1-21.
# https://doi.org/10.1080/1612197X.2021.1877325
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
# Brad's extraction for perceptual accuracy, anxiety, motor accuracy,
# and reaction time
bm_2021_perceptual <- readr::read_csv("data/brad/2021/data_ac.csv")
bm_2021_anxiety <- readr::read_csv("data/brad/2021/data_csai.csv")
bm_2021_motor <- readr::read_csv("data/brad/2021/data_mac.csv")
bm_2021_rt <- readr::read_csv("data/brad/2021/data_rt.csv")

# Abbey's extraction for perceptual accuracy, anxiety, motor accuracy,
# and response time
ac_2021_perceptual <- readr::read_csv("data/abbey/2021/data_ac.csv")
ac_2021_anxiety <- readr::read_csv("data/abbey/2021/data_csai.csv")
ac_2021_motor <- readr::read_csv("data/abbey/2021/data_mac.csv")
ac_2021_rt <- readr::read_csv("data/abbey/2021/data_rt.csv")


# EXTRACTION COMPARISONS ---------------
#
# Compare Brad's and Abbey's extractions for perceptual accuracy data
perceptual_diff <- daff::diff_data(bm_2021_perceptual, ac_2021_perceptual)
daff::render_diff(perceptual_diff)

#>>> Outcome of diff: Brad's extraction contained an error on explicit stress
#>>> test mean.

# Use Abbey's extraction for the main perceptual accuracy variable
main_2021_perceptual <- ac_2021_perceptual

# Compare Brad's and Abbey's extractions for anxiety data
anxiety_diff <- daff::diff_data(bm_2021_anxiety, ac_2021_anxiety)
daff::render_diff(anxiety_diff)

#>>> Outcome of diff: Extractions match

# Use Abbey's extraction for the main anxiety variable
main_2021_anxiety <- ac_2021_anxiety

# Compare Brad's and Abbey's extractions for motor accuracy data
motor_diff <- daff::diff_data(bm_2021_motor, ac_2021_motor)
daff::render_diff(motor_diff)

#>>> Outcome of diff: Extractions match

# Use Abbey's extraction for the main motor accuracy variable
main_2021_motor <- ac_2021_motor

# Compare Brad's and Abbey's extractions for reaction time data
rt_diff <- daff::diff_data(bm_2021_rt, ac_2021_rt)
daff::render_diff(rt_diff)

#>>> Outcome of diff: Extractions match

# Use Abbey's extraction for the main reaction variable
main_2021_rt <- ac_2021_rt


# EFFECT SIZE CALCULATIONS ---------------
#
# Perceptual accuracy data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2021_perceptual)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2021_perceptual)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2021_perceptual)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2021_perceptual)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2021_perceptual)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2021_perceptual)
I_C <- I_C$d

id <- main_2021_perceptual$id

# Create data frame of perceptual accuracy effect sizes for 2021 paper
perceptual_2021 <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
perceptual_2021 <- as.data.frame(perceptual_2021)

# Anxiety data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2021_anxiety)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2021_anxiety)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2021_anxiety)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2021_anxiety)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2021_anxiety)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2021_anxiety)
I_C <- I_C$d

id <- main_2021_anxiety$id

# Create data frame of anxiety effect sizes for 2021 paper
anxiety_2021 <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
anxiety_2021 <- as.data.frame(anxiety_2021)


# Motor accuracy data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2021_motor)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2021_motor)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2021_motor)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2021_motor)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2021_motor)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2021_motor)
I_C <- I_C$d

id <- main_2021_motor$id

# Create data frame of the motor accuracy effect sizes for 2021 paper
motor_2021 <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
motor_2021 <- as.data.frame(motor_2021)


# Reaction time data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2021_rt)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2021_rt)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2021_rt)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2021_rt)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2021_rt)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2021_rt)
I_C <- I_C$d

id <- main_2021_rt$id

# Create data frame of reaction time effect sizes for 2021 paper
rt_2021 <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
rt_2021 <- as.data.frame(rt_2021)

# Data wrangling for Lola & Tzetzis 2021b
#
#
#Lola, A.C., Giatsis, G., Pérez-Turpin, J.A., & Tzetzis, G.C. (2021). The influence of analogies on the development
#of selective attention in novices in normal or stressful conditions. Journal of Human Sport and Exercise, in press.
#https://doi.org/10.14198/jhse.2023.181.12
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
# Brad's extraction for perceptual accuracy and reaction time
bm_2021b_rt <- readr::read_csv("data/brad/2021b/data_rt.csv")
bm_2021b_perceptual <- readr::read_csv("data/brad/2021b/data_ac.csv")

# Mike's extraction for perceptual accuracy and reaction time
mc_2021b_rt <- readr::read_csv("data/mike/2021b/data_rt.csv")
mc_2021b_perceptual <- readr::read_csv("data/mike/2021b/data_ac.csv")


# EXTRACTION COMPARISONS ---------------
#
# Compare Brad's and Mike's extractions for perceptual accuracy data
perceptual_diff <- daff::diff_data(bm_2021b_perceptual, mc_2021b_perceptual)
daff::render_diff(perceptual_diff)

#>>> Outcome of diff: Mike's extraction contained an error on n values

# Use Brad's extraction for the main perceptual accuracy variable
main_2021b_perceptual <- bm_2021b_perceptual

# Compare Brad's and Mike's extractions for reaction time data
rt_diff <- daff::diff_data(bm_2021b_rt, mc_2021b_rt)
daff::render_diff(rt_diff)

#>>> Outcome of diff: Mike's extraction contained an error on n values

# Use Brad's extraction for the main reaction variable
main_2021b_rt <- bm_2021b_rt

# EFFECT SIZE CALCULATIONS ---------------
#
# Perceptual accuracy data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2021b_perceptual)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2021b_perceptual)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2021b_perceptual)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2021b_perceptual)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2021b_perceptual)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2021b_perceptual)
I_C <- I_C$d

id <- main_2021b_perceptual$id

# Create data frame of perceptual accuracy effect sizes for 2021 paper
perceptual_2021b <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
perceptual_2021b <- as.data.frame(perceptual_2021b)

# Reaction time data
E_A <- compute.es::mes(E_m, A_m, E_sd, A_sd, n, n,
                       id = id, data = main_2021b_rt)
E_A <- E_A$d

I_E <- compute.es::mes(I_m, E_m, I_sd, E_sd, n, n,
                       id = id, data = main_2021b_rt)
I_E <- I_E$d

E_C <- compute.es::mes(E_m, C_m, E_sd, C_sd, n, n,
                       id = id, data = main_2021b_rt)
E_C <- E_C$d

A_I <- compute.es::mes(A_m, I_m, A_sd, I_sd, n, n,
                       id = id, data = main_2021b_rt)
A_I <- A_I$d

A_C <- compute.es::mes(A_m, C_m, A_sd, C_sd, n, n,
                       id = id, data = main_2021b_rt)
A_C <- A_C$d

I_C <- compute.es::mes(I_m, C_m, I_sd, C_sd, n, n,
                       id = id, data = main_2021b_rt)
I_C <- I_C$d

id <- main_2021b_rt$id

# Create data frame of reaction time effect sizes for 2021 paper
rt_2021b <- cbind(E_A, I_E, E_C, A_I, A_C, I_C, id)
rt_2021b <- as.data.frame(rt_2021b)

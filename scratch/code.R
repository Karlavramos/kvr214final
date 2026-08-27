# Prepare data -----------------------------------------------------------

library(tidyverse)

PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv")

# source moving average function and apply to each site
source("R/moving-average.R")

PRM_moving <- moving_average(PRM_data)
bq1_moving <- moving_average(bq1_data)
bq2_moving <- moving_average(bq2_data)
bq3_moving <- moving_average(bq3_data)


# Plot data per site ----------------------------------------------------

PRM_moving |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  ) |>
  ggplot(
    mapping = aes(x = window_start, y = Concentration, color = Ion)
  ) +
  geom_line() +
  facet_wrap(~Ion)

bq1_moving |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  ) |>
  ggplot(
    mapping = aes(x = window_start, y = Concentration, color = Ion)
  ) +
  geom_line() +
  facet_wrap(~Ion)

bq2_moving |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  ) |>
  ggplot(
    mapping = aes(x = window_start, y = Concentration, color = Ion)
  ) +
  geom_line() +
  facet_wrap(~Ion)

bq3_moving |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  ) |>
  ggplot(
    mapping = aes(x = window_start, y = Concentration, color = Ion)
  ) +
  geom_line() +
  facet_wrap(~Ion)

library(tidyverse)

PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv")

source("R/moving-average.R")

# Initialize Start -------------------------------------------------------

# Need to filter dates first

PRM_moving <- moving_average(PRM_data)

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

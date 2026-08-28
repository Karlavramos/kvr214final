# Load packages
library(tidyverse)

# Source functions
source("R/moving-average.R")
source("R/tidy-data.R")

# Read the csv for each site and select needed data with tidy_data function
PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv") |> tidy_data()
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv") |> tidy_data()
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv") |> tidy_data()
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv") |> tidy_data()

# Source moving average function and apply to each site
PRM_moving <- moving_average(PRM_data)
bq1_moving <- moving_average(bq1_data)
bq2_moving <- moving_average(bq2_data)
bq3_moving <- moving_average(bq3_data)

# Combine the moving averages into one dataframe
all_sites_data <- bind_rows(PRM_moving, bq1_moving, bq2_moving, bq3_moving)

# Pivot longer to collapse all ions into one column to facit by ion when developing ggpplot
all_sites_longer <- all_sites_data |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  )

# Create a new csv with new dataframe
write_csv(all_sites_longer, "output/figure3_data.csv")

library(tidyverse)
source("R/moving-average.R")
source("R/tidy-data.R")

# Read the csv for each site and select needed data with tidy_data function
PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv") |> tidy_data()
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv") |> tidy_data()
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv") |> tidy_data()
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv") |> tidy_data()

# source moving average function and apply to each site
PRM_moving <- moving_average(PRM_data)
bq1_moving <- moving_average(bq1_data)
bq2_moving <- moving_average(bq2_data)
bq3_moving <- moving_average(bq3_data)

# combine the moving averages data
all_sites_data <- bind_rows(PRM_moving, bq1_moving, bq2_moving, bq3_moving)

write_csv(all_sites_data, "output/output.csv")

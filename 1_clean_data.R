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

all_sites_data <- bind_rows(PRM_moving, bq1_moving, bq2_moving, bq3_moving)

write_csv(all_sites_data, "output/output.csv")

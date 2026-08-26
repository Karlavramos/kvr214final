library(tidyverse)

PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv.csv")
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv.csv")
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv.csv")

Elements <- c("`NH4-N`", "Ca", "Mg", "NO3-N", "K")

# Remove elements of the data that we do not need anymore
PMR_K <- PRM_data |>
  select("Sample_Date", "K")
glimpse(PMR_data)


PMR_K |>
  mutate(Year = year(Sample_Date)) |>
  filter(Year >= "1988" & Year < "1993") |>
  ggplot(
    mapping = aes(x = Sample_Date, y = K)
  ) +
  geom_point()

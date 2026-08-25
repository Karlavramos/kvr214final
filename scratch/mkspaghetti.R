library(tidyverse)

PRM_dataaa <- read_csv("data/RioMameyesPuenteRoto.csv")

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
git

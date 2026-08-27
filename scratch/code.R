# Prepare data -----------------------------------------------------------

library(tidyverse)

read_csv("output/output.csv")


# Plot data per site ----------------------------------------------------

all_sites_data |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  ) |>
  ggplot(
    mapping = aes(
      x = window_start,
      y = Concentration,
      color = site,
      linetype = site
    )
  ) +
  geom_line() +
  facet_wrap(~Ion, scales = "free", ncol = 1)

tail(all_sites_data)

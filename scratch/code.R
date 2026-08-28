# load package
library(tidyverse)

# read csv created in ouput folder
read_csv("output/figure3_data.csv")


# Pivot longer to collapse all ions into one column to facit by ion
# when making ggpplot
all_sites_longer <- all_sites_data |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, no3_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  )

ggplot(
  data = all_sites_longer,
  mapping = aes(
    x = window_start,
    y = Concentration,
    color = site,
    linetype = site
  )
) +
  geom_line() +
  facet_wrap(~Ion, scales = "free", ncol = 1)

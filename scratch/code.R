library(tidyverse)

PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv")
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv")

# Initialize Start -------------------------------------------------------

# Need to filter dates first
bq1_data <-
  filter(
    year(bq1_data$Sample_Date) >= 1988 &
      year(bq1_data$Sample_Date) <= 1994
  )

bq1_smoothed <- tibble(
  window_start = seq(
    ymd(bq1_data$Sample_Date[1]),
    ymd(bq1_data$Sample_Date[nrow(bq1_data)]),
    by = "63 days"
  ),
  k_mgl = NA,
  mg_mgl = NA,
  n03_ugl = NA,
  ca_mgl = NA,
  nh4_ugl = NA,
)

for (i in 1:nrow(bq1_smoothed)) {
  {
    w1 <- bq1_smoothed$window_start[i]

    w2 <- w1 + 63

    # potasium
    k_ranges <- bq1_data$K[
      bq1_data$Sample_Date >= w1 &
        bq1_data$Sample_Date < w2
    ]
    # magnessium
    mg_ranges <- bq1_data$Mg[
      bq1_data$Sample_Date >= w1 &
        bq1_data$Sample_Date < w2
    ]

    n03_ranges <- bq1_data$`NO3-N`[
      bq1_data$Sample_Date >= w1 &
        bq1_data$Sample_Date < w2
    ]

    ca_ranges <- bq1_data$Ca[
      bq1_data$Sample_Date >= w1 &
        bq1_data$Sample_Date < w2
    ]
    nh4_ranges <- bq1_data$`NH4-N`[
      bq1_data$Sample_Date >= w1 &
        bq1_data$Sample_Date < w2
    ]

    mean_k <- mean(k_ranges)
    bq1_smoothed$k_mgl[i] <- mean_k

    mean_mg <- mean(mg_ranges)
    bq1_smoothed$mg_mgl[i] <- mean_mg

    mean_n03 <- mean(n03_ranges)
    bq1_smoothed$n03_mgl[i] <- mean_n03

    mean_ca <- mean(ca_ranges)
    bq1_smoothed$ca_mgl[i] <- mean_ca

    mean_nh4 <- mean(nh4_ranges)
    bq1_smoothed$nh4_mgl[i] <- mean_nh4
  }
}

bq1_smoothed |>
  pivot_longer(
    cols = c(k_mgl, mg_mgl, n03_ugl, ca_mgl, nh4_ugl),
    values_to = "Concentration",
    names_to = "Ion"
  ) |>
  ggplot(
    mapping = aes(x = window_start, y = Concentration, color = Ion)
  ) +
  geom_line() +
  facet_wrap(~Ion)

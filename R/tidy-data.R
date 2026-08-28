# Load package
library(tidyverse)

# Function created to filter dates and select ions needed for analysis
tidy_data <- function(site_data) {
  tidy_data <- site_data |>
    filter(
      Sample_Date >= ymd("1988-01-01") & Sample_Date < ymd("1994-12-31")
    ) |>
    select(Sample_Date, Sample_ID, K, Mg, `NH4-N`, `NO3-N`, Ca)
  # Return data
  return(tidy_data)
}

library(tidyverse)

# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(stream_data) {
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = seq(
      ymd("1988-01-01"),
      ymd("1994-12-31"),
      by = "9 weeks"
    ),
    site = stream_data$Sample_ID[1],
    k_mgl = NA,
    mg_mgl = NA,
    no3_ugl = NA,
    ca_mgl = NA,
    nh4_ugl = NA
    # Fill in the rest of the ions
  )

  # Fill in the iterator and sequence
  for (i in 1:nrow(result)) {
    # Create variables for the start and end of the current window
    w1 <- result$window_start[i]
    w2 <- result$window_start[i] + weeks(9)

    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- w1 <= stream_data$Sample_Date & w2 > stream_data$Sample_Date

    # Use indexing to pull out the ion concentrations that fall inside the window
    k_window <- stream_data$K[in_window]

    mg_window <- stream_data$Mg[in_window]

    no3_window <- stream_data$`NO3-N`[in_window]

    ca_window <- stream_data$Ca[in_window]

    nh4_window <- stream_data$`NH4-N`[in_window]
    # The line above gets potassium in the window. Get the rest of the ions too

    # Calculate the mean of each ion concentration and fill in the result
    result$k_mgl[i] <- mean(k_window, na.rm = TRUE)
    result$mg_mgl[i] <- mean(mg_window, na.rm = TRUE)
    result$no3_ugl[i] <- mean(no3_window, na.rm = TRUE)
    result$ca_mgl[i] <- mean(ca_window, na.rm = TRUE)
    result$nh4_ugl[i] <- mean(nh4_window, na.rm = TRUE)
  }

  # Return the result
  return(result)
}

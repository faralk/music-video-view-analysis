#### Preamble ####
# Purpose: Tests the data that from my analysis dataset "data/raw_data/Youtube Charts - Global Weekly"
# Author: Fares Alkorani
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: Run 02-download_data.R, 03-data_cleaning.R
#                 Install the packages under "General" and "Web Scraping" in 00-install_scripts (if not already installed). 

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Test data ####

set.seed(853)

youtube_views <- read_parquet(file="data/analysis_data/youtube-charts.parquet")

# Test if the dates are all 7 days apart

date_diffs <- diff(youtube_views$date)
all_equal <- all(date_diffs == 7)

if (all_equal) {
  print("TRUE")
} else {
  print("FALSE")
}

# Test if the sum of all views is positive

all_greater_than_zero <- all(youtube_views$total_views > 0)
if (all_greater_than_zero) {
  print("All values in the column are greater than 0.")
} else {
  print("Not all values in the column are greater than 0.")
}

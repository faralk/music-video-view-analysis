#### Preamble ####
# Purpose: Cleans and combines all the data from "data/raw_data/Youtube Charts - Global Weekly"
# Author: Fares Alkorani
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: Run 02-download_data.R 
#                 Install the packages under "General" and "Web Scraping" in 00-install_scripts (if not already installed). 

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####

# Extracting the date from the default filename of the chart (when it is downloaded)
# and adding a column for it in each file, then writing each updated chart to Youtube Charts - Global Weekly (Additional)

set.seed(853)

dates <- seq(as.Date("2016-02-25"), as.Date("2024-04-04"), by=7)
for (d in as.list(dates)) {
  filepath <- paste("data/raw_data/Youtube Charts - Global Weekly/youtube-charts-top-videos-global-weekly-", (format(d, format="%Y%m%d")), ".csv", sep='')
  chart <- read_csv(filepath)
  date <- rep(as.Date(d), nrow(chart))
  chart$date <- date
  filepath_date <- paste("data/raw_data/Youtube Charts - Global Weekly (Additional)/youtube-charts-top-videos-global-weekly-", (format(d, format="%Y%m%d")), ".csv", sep='')
  write_csv(chart, filepath_date)
}

# List of weekly chart file paths
file_paths <- list.files(path = "data/raw_data/Youtube Charts - Global Weekly (Additional)", pattern = "\\.csv$", full.names = TRUE)

# Initialize an empty list to store all weekly charts
weekly_charts <- list()

# Read each CSV file into a dataframe and store in the list
for (file_path in file_paths) {
  weekly_chart <- read.csv(file_path)
  weekly_charts <- c(weekly_charts, list(weekly_chart))
}

# Combine all the chart data into one file
all_weekly_charts <- do.call(rbind, weekly_charts)
all_weekly_charts_filepath <- "data/raw_data/youtube-charts-top-videos-global-weekly-combined.csv"

all_weekly_charts$weeks_since <- as.numeric(difftime(all_weekly_charts$date, as.Date("2017-09-07"), units = "weeks"))

all_weekly_charts_summarized <- all_weekly_charts %>%
  group_by(weeks_since, date) %>%
  summarise(total_views = sum(Views))

all_weekly_charts$date <- as.Date(all_weekly_charts$date)


analysis_data <- all_weekly_charts_summarized %>% filter(weeks_since >= 0) 

## Save data

write_parquet(x = analysis_data,
              sink = "data/analysis_data/youtube-charts.parquet")



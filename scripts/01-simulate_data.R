#### Preamble ####
# Purpose: Simulates the dataset for the most watched Global Weekly Top Music Videos from 2016-02-25 to 2024-04-04.
# Author: Fares Alkorani
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: Install the packages under "General" in 00-install_scripts (if not already installed). 


#### Workspace setup ####
library(tidyverse)
library(lubridate)

#### Simulate data ####

set.seed(853)

# Define start and end dates
start_date <- as.Date("2017-09-04")
end_date <- as.Date("2024-04-04")

# Create a sequence of dates 7 days apart
dates <- seq(from = start_date, to = end_date, by = "7 days")

# Generate random positive integers
random_integers <- sample.int(900000000, length(dates), replace = TRUE) + 100000000

# Calculate the number of weeks since start date
weeks_since_start <- as.numeric(difftime(dates, start_date, units = "weeks"))

# Combine into a dataframe
df <- data.frame(
  dates = dates,
  random_integers = random_integers,
  weeks_since_start = weeks_since_start
)

# Print the first few rows of the dataframe
head(df)





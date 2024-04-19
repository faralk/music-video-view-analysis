#### Preamble ####
# Purpose: Models the total number of music video views from the current week of the chart"
# Author: Fares Alkorani
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: Run 02-download_data.R 
#                 Install the packages under "General" and "Modelling" in 00-install_scripts (if not already installed). 


#### Workspace setup ####

library(arrow)
library(broom)
library(broom.mixed)
# library(knitr)
library(modelsummary)
# library(purrr)
library(rstanarm)
# library(testthat)
library(tidyverse)
library(tidybayes)

set.seed(853)

#### Read data ####
youtube_views <- read_parquet(file="data/analysis_data/youtube-charts.parquet")
youtube_views_analysis <- youtube_views %>% select(weeks_since, total_views)

mean <- mean(youtube_views_analysis$total_views)
median <- median(youtube_views_analysis$total_views)

# The mean and median are different, so it is likely that the negative binomial
# distribution would be better

### Model data ####
youtube_views_poisson <-
  stan_glm(
    formula = total_views ~ weeks_since,
    data = youtube_views_analysis,
    family = poisson(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )

youtube_views_nbinom <-
  stan_glm(
    formula = total_views ~ weeks_since,
    data = youtube_views_analysis,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )

youtube_views_nbinom_improved <-
  stan_glm(
    formula = total_views ~ weeks_since,
    data = youtube_views_analysis,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 21.266, scale = 2.5, autoscale = TRUE),
    seed = 853
  )

#### Save models ####
saveRDS(
  youtube_views_poisson,
  file = "models/youtube_views_poisson.rds"
)

saveRDS(
  youtube_views_nbinom,
  file = "models/youtube_views_nbinom.rds"
)

saveRDS(
  youtube_views_nbinom_improved,
  file = "models/youtube_views_nbinom_improved.rds"
)

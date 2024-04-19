#### Preamble ####
# Purpose: This file provides you with the opportunity to get setup within the project itself,
#          but the specific instructions are available within each subsequent file if you wish
#          to setup as you go.
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: Install the packages under "General" in 00-install_scripts (if not already installed). 

set.seed(853)

# General (all scripts)

install.packages("tidyverse")
install.packages("arrow")


# Web Scraping (02-download_data.R)

install.packages("rvest")
install.packages("RSelenium")


# Modelling (05-model.R)

install.packages("rstanarm")
install.packages("modelsummary")
install.packages("broom.mixed")
install.packages("broom")


# Misc #
## Packages that were needed but could not be used due to limitations.

### install.packages("remotes")
### install.packages("devtools")

### Downloads latest geniusr development version (recommended by author)
### remotes::install_github("ewenme/geniusr") 

### Language detection (to translate the song titles)
### devtools::install_github("ropensci/cld2") # Language detection

### install.packages("spotifyr")

## Web Scraping

### install.packages("RCurl")
### install.packages("stringi")

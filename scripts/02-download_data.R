#### Preamble ####
# Purpose: Downloads all the most watched Global Weekly Top Music Videos from 2016-02-25 to 2024-04-04 at charts.youtube.com.
# Author: Fares Alkorani
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: Install the packages under "General" and "Web Scraping" in 00-install_scripts (if not already installed). 

#### Workspace setup ####
library(RSelenium)
library(tidyverse)

#### Download data ####

set.seed(853)

# Feel free to change the port number (e.g. write port=4538L) if
# your device happens to be using port 4537 already. 

# In addition, ensure that you have downloaded the latest chrome driver and
# place the version code in the chromever field on the next line of code.
# 123.0.6312.123 is the latest as of April 18, 2024 and it is placed in the rsDriver code
# You can download the driver by visiting https://googlechromelabs.github.io/chrome-for-testing/.

# If you are having issues getting the driver setup, you can alternately visit
# charts.youtube.com/charts/TopVideos/global/weekly and visit each week and download
# the respective dataset.

rD <- rsDriver(browser="chrome", port=4537L, chromever = "123.0.6312.123")

# A Google Chrome window should have opened after executing the above command,
# you can watch the files being downloaded but do not visit any other pages such that
# you do not interfere with the scraping.

remDr <- rD[["client"]]

# Downloads all the Global Weekly Top Music Videos From 2016-02-25 to 2024-04-04.

# Credit to https://stackoverflow.com/questions/43429788/python-selenium-finds-h1-element-but-returns-empty-text-string
# for help with finding the download button xpath.

dates <- seq(as.Date("2016-02-25"), as.Date("2024-09-14"), by=7)
for (d in as.list(dates)) {
    remDr$navigate(paste("https://charts.youtube.com/charts/TopVideos/global/weekly/", (format(d, format="%Y%m%d")), sep=''))
    Sys.sleep(4)
    button <- remDr$findElement(using="xpath", value='//*[@id="download-button"]')
    button$clickElement() # Credit to https://stackoverflow.com/questions/69243012/rselenium-click-button-and-download-generated-csv for knowing how to press a button.
    Sys.sleep(1)
}

#### Save data ####

# Now, there should be roughly 424 .csv files with a "youtube-charts-top-videos-global-weekly"
# prefix saved in your "Downloads" folder.
# I manually copied these files to ""data/raw_data/Youtube Charts - Global Weekly", but feel
# free to copy these to a folder of your liking.
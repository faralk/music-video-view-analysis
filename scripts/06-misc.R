#### Preamble ####
# Purpose: Keeps old code that was originally used but could not be used anymore
# Author: Fares Alkorani
# Date: 18 April 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: N/A

# ORIGINALLY IN 05-model.R 

# youtube_views_poisson_improved <-
#   stan_glm(
#     formula = total_views ~ weeks_since,
#     data = youtube_views_analysis,
#     family = poisson(link = "log"),
#     prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_intercept = normal(location = 21, scale = 2.5, autoscale = TRUE),
#     prior_aux = exponential(rate = 1, autoscale = TRUE),
#     seed = 853
#   )

# saveRDS(
#   youtube_views_poisson_improved,
#   file = "models/youtube_views_poisson_improved.rds"
# )



# ORIGINALLY IN 03-data_cleaning.R after 
# all_weekly_charts_filepath <- "data/raw_data/youtube-charts-top-videos-global-weekly-combined.csv"


# Print the combined dataframe

# rD <- rsDriver(browser="chrome", port=4550L, chromever = "123.0.6312.123")

# remDr <- rD[["client"]]

# for (i in seq_along(all_weekly_charts$YouTube.URL)) {
#   # Check the value in column1 and update column2 accordingly
#   
#   url <- all_weekly_charts$YouTube.URL[i]
#   
#   if (url == "n/a") { # if there's no URL
#     next
#   }
#   else {
#     # remDr$navigate(url)
#     webpage <- RCurl::getURL(url)
#     
#     # APPROX DURATION MS APPEARS MULTIPLE TIMES IN THE WEBPAGE AND WE ONLY TAKE THE FIRST ONE
#     # BUT THEY ARE CLOSE ENOUGH SUCH THAT IT DOESNT MATTER ANYWAY
#     
#     # https://stackoverflow.com/questions/37978031/find-youtube-video-duration-using-r
#     # https://stackoverflow.com/questions/15302925/convert-milliseconds-to-time-in-r
#     
#     ## GET DURATION OF VIDEO
#     
#     milliseconds <- strtoi(stringi::stri_match_first_regex(webpage, "approxDurationMs\":\"(.*?)\",")[[2]])
#     all_weekly_charts$Milliseconds[i] <- milliseconds
#     all_weekly_charts$Duration[i] <- format( as.POSIXct(Sys.Date())+milliseconds/1000, "%M:%S")
#     
#     GET VIDEO DESCRIPTION FOR TITLE 
#
#     # Sys.sleep(5)
#     # page <- remDr$getPageSource()
#     # 
#     # artist <- page[[1]] %>% read_html() %>% html_node("#items > yt-video-attribute-view-model > div > a > div.yt-video-attribute-view-model__metadata > h4") %>% html_text()
#     # title <- page[[1]] %>% read_html() %>% html_node("#items > yt-video-attribute-view-model > div > a > div.yt-video-attribute-view-model__metadata > h1") %>% html_text()
#     # 
#     # if (is.na(artist) == FALSE & is.na(title) == FALSE) {
#     #   combined_df$Description[i] <- 1
#     #   combined_df$Artist.Names[i] <- artist
#     #   combined_df$Video.Title[i] <- title
#     # }
#     # else {
#     #   combined_df$Description[i] <- 0
#     # }
#   }
# }

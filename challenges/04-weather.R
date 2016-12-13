# Weather data challenge
library(purrr)

# Your task ---
# Below you will find code that downloads, manipulates, plots and saves
# one day, Dec 8, of weather data for Corvallis.  Your job is to rewrite 
# this to replicate for Dec 6 - Dec 10

library(tidyverse)

# Downloading data --------------------------------------------------------
# note date is part of url
download.file("https://www.wunderground.com/history/airport/KCVO/2016/12/8/DailyHistory.html?format=1", "data/weather/dec8.csv")

# Read in file -----------------------------------------------------------
col_types <- c("cnnnnnccccccnc")

dec8 <- read_csv("data/weather/dec8.csv", skip = 1, na = c("-", "N/A"), 
  col_types = col_types)

# Add date columns --------------------------------------------------------

dec8 <- mutate(dec8, year = 2016, month = 12, day = 8)
# add add a datetime variable
dec8 <- mutate(dec8,
  datetime = as.POSIXct(strptime(
    paste(year, month, day, TimePST, sep = " "), "%Y %m %d %I:%M %p")))

# Make and save plot -------------------------------------------------------

qplot(datetime, TemperatureF, data = dec8,
  geom = "line") +
  ggtitle("Dec 8")
ggsave("data/weather/plots/dec8.png")


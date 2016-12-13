# Word count challenge
library(purrr)

# Your task ----
# Produce a named numeric vector that contains the word counts for all
# files with a *.md extension:
## geospatial-README.md           nass-README.md purrr-workshop-README.md 
##                  232                      312                      216 

# To get you started
files <- dir("challenges/word_count_files", pattern = "*.md", 
  full.names = TRUE)
files

?readr::read_lines
?stringi::stri_stats_latex

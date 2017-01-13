library(neiss)
library(tidyverse)
library(lubridate)


# Add time vars -----------------------------------------

injuries <- injuries %>%  mutate(
  wday = factor(wday(trmt_date, label = TRUE)),
  month = factor(month(trmt_date, label = TRUE))
)

# most indicated products -------------------------------------------------

# can use products df to look up
product_lookup <- products$title %>% set_names(products$code)

product_counts <- table(c(injuries$prod1, injuries$prod2))
# at least 10000 occurances
common_codes <- names(product_counts[product_counts > 50000])
common_names <- product_lookup[common_codes]


# split by common products -------------------------------------------------
# SLOW! probably find a better way, summarise first?
by_prod <- map(common_codes, ~ filter(injuries, prod1 == .x | prod2 == .x))

# summarise to day counts
per_day <- map(by_prod, 
  ~ .x %>% group_by(trmt_date, month, wday) %>% summarise(count = n()))  

per_day <- set_names(per_day, common_codes)
save(per_day, common_codes, common_names, file = "data/neiss_by_day.rda",
  compress = TRUE)


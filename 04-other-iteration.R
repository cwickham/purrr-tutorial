library(purrr)
library(ggplot2)
load("data/neiss_by_day.rda")

# Explore time series -----------------------------------------------------
head(per_day[[1]])
ggplot(per_day[[1]], aes(trmt_date, count)) + geom_line()


plots <- map(per_day, ~ ggplot(.x, aes(trmt_date, count)) + geom_line())
plots[[1]]

# just for fun
library(neiss)
library(lubridate)
library(dplyr)
xmas_knife_injuries <- filter(injuries, 
  month == "Dec", mday(trmt_date) == 25, prod1 == "464" | prod2 == "464")
sample(xmas_knife_injuries$narrative, 5)

# see plots
walk(plots, print)

# save plots
walk2(paste0(common_codes, ".png"),
  plots, ggsave, width = 10, height = 3)

walk2(paste0(common_codes, ".png"),
  plots, ggsave,
  width = 10, height = 3)


# Use map2 to add titles
plots_with_titles <- map2(per_day, common_names, 
  ~ qplot(trmt_date, count, data = .x, geom = "line") + ggtitle(.y))

plots_with_titles[[1]]

# Fit naive models
models <- map(per_day, ~ lm(count ~ month + wday, data = .x))

map2_dbl(models, per_day, modelr::rsquare)

accidents <- tibble(
  name = common_names,
  code = common_codes,
  data = per_day)

accidents %>%
  mutate(
    model = map(data, ~ lm(count ~ month + wday, data = .x)),
    rsquare = map2_dbl(model, data, modelr::rsquare)) %>%
  arrange(rsquare) %>% 
  select(name, rsquare)


# Why does rsquare take two arguments?
# so you can do this kind of thing
accidents <- accidents %>% 
  mutate(
    train = map(ts, ~ filter(.x, trmt_date < "2014-01-01")),
    test = map(ts, ~ filter(.x, trmt_date >= "2014-01-01")),
    model = map(train, ~ lm(count ~ month + wday, data = .x)))

accidents <- accidents %>% 
  mutate(
    rsquare_test = map2_dbl(model, test, modelr::rsquare)
  )

accidents %>% arrange(rsquare_test) %>% select(name, rsquare_test)


library(purrr)
load("data/swapi.rda")

# Typed functions
people <- people %>% set_names(map_chr(people, "name"))

# How many starships has each character been in?
map(people, ~ length(.x[["starships"]]))

# What color is each characters hair?
map(people, ~ .x[["hair_color"]])

# Is the character male?
map(people, ~ .x[["gender"]] == "male")

# How heavy is each character?
map(people, ~ .x[["mass"]])


# How many starships has each character been in?
map_int(people, ~ length(.x[["starships"]]))

# What color is each characters hair?
map_chr(people, ~ .x[["hair_color"]]) 

# Is the character male?
map_lgl(people, ~ .x[["gender"]] == "male") 

# How heavy is each character?
map_dbl(people, ~ .x[["mass"]])
# Doesn't work...because we get a string back
map(people, ~ .x[["mass"]])

# A little risky
map_dbl(people, ~ as.numeric(.x[["mass"]]))

# Probably want something like:
map_chr(people, ~ .x[["mass"]]) %>%
  readr::parse_number(na = "unknown")


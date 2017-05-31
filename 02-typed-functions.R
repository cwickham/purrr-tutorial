library(purrr)
library(repurrrsive)

# Typed functions
sw_people <- sw_people %>% set_names(map_chr(sw_people, "name"))

# How many starships has each character been in?
map(sw_people, ~ length(.x[["starships"]]))

# What color is each characters hair?
map(sw_people, ~ .x[["hair_color"]])

# Is the character male?
map(sw_people, ~ .x[["gender"]] == "male")

# How heavy is each character?
map(sw_people, ~ .x[["mass"]])




# Solutions ---------------------------------------------------------------

# How many starships has each character been in?
map_int(sw_people, ~ length(.x[["starships"]]))

# What color is each characters hair?
map_chr(sw_people, ~ .x[["hair_color"]]) 

# Is the character male?
map_lgl(sw_people, ~ .x[["gender"]] == "male") 

# How heavy is each character?
map_dbl(sw_people, ~ .x[["mass"]])
# Doesn't work...because we get a string back
map(sw_people, ~ .x[["mass"]])

# A little risky
map_dbl(sw_people, ~ as.numeric(.x[["mass"]]))

# Probably want something like:
map_chr(sw_people, ~ .x[["mass"]]) %>%
  readr::parse_number(na = "unknown")


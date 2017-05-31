# Star wars challenges
library(purrr)
library(repurrrsive)

# Which film (see films) has the most characters?
map(sw_films, "characters") %>%
  map_int(length) %>%
  set_names(map_chr(sw_films, "title")) %>%
  sort()

# Which species has the most possible eye colors?
sw_species[[1]]$eye_colors

map_chr(sw_species, "eye_colors") %>%
  strsplit(", ") %>%
  map_int(length) %>%
  set_names(map_chr(sw_species, "name"))
# this is lazy, what about n/a and unknown?

# Which planets do we know the least about?
# For one, entry 61
map_lgl(sw_planets[[61]], ~ "unknown" %in% .x) %>%
  sum()

# For all
map_int(sw_planets, 
  ~ map_lgl(.x, ~ "unknown" %in% .x) %>% sum()) %>%
  set_names(map_chr(sw_planets, "name")) %>%
  sort(decreasing = TRUE)

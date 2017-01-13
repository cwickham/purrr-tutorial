# Star wars challenges
library(purrr)

# loads objects: films, people, vehicles, starships, 
# planets & species
load("data/swapi.rda")

# Which film (see films) has the most characters?
map(films, "characters") %>%
  map_int(length) %>%
  set_names(map_chr(films, "title")) %>%
  sort()

# Create the planet_lookup vector from earlier.
planet_lookup <- map_chr(planets, "name") %>% 
  set_names(map(planets, "url"))

# Which species has the most possible eye colors?
species[[1]]$eye_colors

map_chr(species, "eye_colors") %>%
  strsplit(", ") %>%
  map_int(length)
# this is lazy, what about n/a and unknown?


# star wars people list to data frame
library(tidyverse)
library(repurrrsive)

# A useful lookup table -----------------------------------------------
film_number_lookup <- map_chr(sw_films, "url") %>%
  map(~ stringr::str_split_fixed(.x, "/", 7)[, 6])  %>%
  as.numeric() %>%
  set_names(map_chr(sw_films, "url"))

# Putting a few vars in a tibble --------------------------------------
people_tbl <- tibble(
  name    = sw_people %>% map_chr("name"), 
  films   = sw_people %>% map("films"),
  height  = sw_people %>% map_chr("height") %>% 
    readr::parse_number(na = "unknown"),
  species = sw_people %>% map_chr("species", .null = NA_character_)
)

# Turning parts of our list to a tibble -----------------------------------
people_tbl$films

# Use map with mutate to manipulate list columns
people_tbl <- people_tbl %>%
  mutate(
    film_numbers = map(films, 
      ~ film_number_lookup[.x]),
    n_films = map_int(films, length)
  )
    
people_tbl %>% select(name, film_numbers, n_films)


# Your Turn ---------------------------------------------------------------

# Create a new character column that collapses the film numbers in a single string,
# e.g. for Luke " 6, 3, 2, 1, 7"

people_tbl <- people_tbl %>% 
  mutate(films_squashed = map_chr(film_numbers, paste, 
    collapse = ", "))

people_tbl %>% select(name, n_films, films_squashed)


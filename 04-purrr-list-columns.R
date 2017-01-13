# star wars people list to data frame
library(purrr)
library(tibble)
library(dplyr)

load("data/swapi.rda")

# Putting a few vars in a tibble
people_tbl <- tibble(
  name    = people %>% map_chr("name"), 
  films   = people %>% map("films"),
  height  = people %>% map_chr("height") %>% 
                       readr::parse_number(na = "unknown"),
  species = people %>% map_chr("species", .null = NA_character_)
)

# A list column is a column which is a list
people_tbl$films

# Use map with mutate to manipulate list columns
people_tbl <- people_tbl %>%
  mutate(
    film_numbers = map(films, ~ film_number_lookup[.x]),
    n_films = map_int(films, length)
  )
    
people_tbl %>% select(name, film_numbers, n_films)


# Your Turn ---------------------------------------------------------------

# Create a new character column that collapses the film numbers in a single string,
# e.g. for Luke " 6, 3, 2, 1, 7"


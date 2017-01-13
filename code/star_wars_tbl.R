# star wars people list to data frame
library(purrr)
library(tibble)
library(dplyr)

load("data/swapi.rda")

# Luke has all fields
names(people[[1]])

# Putting it all in a tibble
people_tbl <- tibble(
  name = people %>% map_chr("name"),
  height = people %>% map_chr("height") %>% readr::parse_number(na = "unknown"),
  mass = people %>% map_chr("mass") %>% readr::parse_number(na = "unknown"),
  hair_color = people %>% map_chr("hair_color"),
  skin_color = people %>% map_chr("skin_color"),
  eye_color = people %>% map_chr("eye_color"),
  birth_year = people %>% map_chr("birth_year"),
  gender = people %>% map_chr("gender"),
  homeworld = people %>% map_chr("homeworld"),
  films = people %>% map("films"),
  species = people %>% map_chr("species", .null = NA_character_),
  vehicles = people %>% map("vehicles"),
  starships = people %>% map("starships"),
  created = people %>% map_chr("created") %>% readr::parse_datetime(),
  edited = people %>% map_chr("edited") %>% readr::parse_datetime(),
  url = people %>% map_chr("url")
)


# Some useful lookup tables -----------------------------------------------

film_lookup <- map_chr(films, "title") %>% set_names(map_chr(films, "url"))
film_number_lookup <- stringr::str_split_fixed(names(film_lookup), "/", 7)[, 6]  %>%
  as.numeric() %>%
  set_names(map_chr(films, "url"))


# use map() on a list column ----------------------------------------------

# finding film info for each person
people_tbl <- people_tbl %>%
  mutate(
    n_films = map_int(films, length),
    film_names = map(films, ~ film_lookup[.x]),
    film_numbers = map(films, ~ film_number_lookup[.x])
  )
  
people_tbl %>% select(n_films, film_names)
people_tbl$film_names

# might be easier to have a squashed version for easy eye-balling
people_tbl <- people_tbl %>%
  mutate(films_squashed = map_chr(film_numbers, paste, collapse = ", "))

people_tbl %>% select(name, films_squashed)

# In order would be better
people_tbl <- people_tbl %>%
  mutate(films_squashed = map_chr(film_numbers, 
    ~ paste(sort(.x), collapse = ", ")))

people_tbl %>% select(name, films_squashed)

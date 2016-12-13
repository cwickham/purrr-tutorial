library(purrr)

# load star wars data from swapi.co
load("data/swapi.rda")

# The films list
str(films, max.level = 2)

# What kind of object is returned from map()?
map(films, length)
map(films, names)
map(films, getElement, "title")
map(films, getElement, "characters")

# Simpler output: map_*()  ------------------------------------------------

# How many elements are in each film entry? 
map(films, length)
map_int(films, length)

# Get the titles of films as a character vector


characters_by_film <- map(films, getElement, "characters")
# Get the number of characters in each film


str(vehicles, max.level = 2)
# Get the number of crew in each vehicle as an integer vector



# Specifying .f -----------------------------------------------------------

# the name of a function 
map(films, getElement, "characters")

get_chars <- function(x){
  x[["characters"]]
}

# the name of a function I've defined
map(films, get_chars)

# an anonymous function
map(films, function(x) x[["characters"]])

# a formula, ~ .x
map(films, ~ .x[["characters"]])

# allows us to do this in one step
map_dbl(films, ~ length(.x[["characters"]]))


# Practice with shortcuts -------------------------------------------------

## Find the first name of each person

# figure it out for one element
luke <- people[[1]]
strsplit(luke[["name"]], " ")[[1]][1]

# map it for all
map_chr(people, ~ strsplit(.x[["name"]], " ")[[1]][1])


# Find the bmi of all people ----------------------------------------------



# pipe operator -----------------------------------------------------------

## Which species have the most eye colors?
num_colors <- map_chr(species, "eye_colors") %>%
  strsplit(", ") %>%
  map_dbl(length) %>%
  set_names(map_chr(species, "name"))


## Your turn: Find the number of characters in each film




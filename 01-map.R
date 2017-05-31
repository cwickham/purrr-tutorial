library(purrr)

library(repurrrsive)
# includes objects: sw_films, sw_people, sw_vehicles, 
# sw_starships, sw_planets & sw_species

# How many elements are in sw_people?
length(sw_people)

# Who is the first person in sw_people?
sw_people[[1]]  # Luke!

# A list inside a list
sw_people[1]

# A list, dropped one level of heirachy
sw_people[[1]]

# How many starships has each character been on?
map(sw_people, ~ length(.x$starships))

# For later
planet_lookup <- map_chr(sw_planets, "name")  %>% 
  set_names(map_chr(sw_planets, "url"))
planet_lookup
save(planet_lookup, file = "data/planet_lookup.rda", compress = FALSE)

## http://swapi.co/
# install_github("ironholds/rwars", ref = "0.5.0")
library(rwars)
library(purrr)

# recursive function to travel down next pages
get_all <- function(x = NULL, old_data = NULL, fun, ...){
  data <- fun(x, ...)
  next_url <- getElement(data, "next")
  if(is_null(next_url)) {
    return(append(old_data, list(data)))
  } else {
    get_all(next_url, append(old_data, list(data)), fun, ...)
  }
}

entities <- c("species", "people", "films", "vehicles", "starships",
  "planets")

all_ents <- map(entities, 
  ~ get_all(fun = match.fun(paste0("get_all_", .x)), parse_result = TRUE))

all_ents <- map(all_ents, ~ transpose(.x)[["results"]] %>% flatten())

map2(entities, all_ents, ~ assign(.x, .y, envir = globalenv()))

save(list = entities, file = "data/swapi.rda", compress = FALSE)

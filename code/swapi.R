## http://swapi.co/
# install.packages("rwars")
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
entity_funs <- map(paste0("get_all_", entities), match.fun)

all_ents <- map(entity_funs, ~ get_all(fun = .x, parse_result = TRUE))

all_ents_res <- map(all_ents, 
  ~ transpose(.x)[["results"]] %>% flatten())

map2(entities, all_ents, ~ assign(.x, .y, envir = globalenv()))

save(list = entities, file = "data/swapi.rda", compress = FALSE)

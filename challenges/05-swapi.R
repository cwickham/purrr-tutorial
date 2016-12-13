# Star Wars API Challenge
# install_github("ironholds/rwars", ref = "0.5.0")
library(rwars)
library(purrr)

# Your task ----
# You should use the rwars package to download all the data, i.e. replicate
# what I did to create the data you've been using.  That is, at the end
# you should have a people, species, films, vehicles, starships and planets
# lists.

# Here's a function I wrote that requests the "next" page of 
# results, until there is no next page
get_all <- function(x = NULL, old_data = NULL, fun, ...){
  data <- fun(x, ...)
  next_url <- getElement(data, "next")
  if(is_null(next_url)) {
    return(append(old_data, list(data)))
  } else {
    get_all(next_url, append(old_data, list(data)), fun, ...)
  }
}

?get_all_people

# For example getting all the people results
people <- get_all(fun = get_all_people,  parse_result = TRUE)

listviewer::jsonedit(people, mode = "view")

entities <- c("species", "people", "films", "vehicles", "starships",
  "planets")

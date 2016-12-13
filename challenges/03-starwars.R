# Star Wars challenge
library(purrr)

# Your task -----
# There are only 11 instances of a character using a vehicle.  
# Your task is to produce text for each of these instances like
# the following:
# "Luke Skywalker used a Snowspeeder"

# To get you started
load("data/swapi.rds")

luke <- people[[1]]

luke[["vehicles"]]

vehicles[[5]][["url"]]
vehicles[[5]][["name"]]


# Extra challenge -----
# Add the film to your text, e.g. 
# "Luke Skywalker used a Snowspeeder in The Empire Strikes Back"
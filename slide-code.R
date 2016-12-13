library(purrr)
# Warmups lists ------------------------------------------------------------

pets <- list(
  scylla = list(type = "cat", colour = "calico"),
  dexter = list(type = "cat", colour = "black")
)

# What is the difference between pets["scylla"] and pets[["scylla"]]?


# How would you extract the colour of Dexter?


# Warmups - functions -----------------------------------------------------

count_na <- function(x, ...){
  sum(is.na(x), ...)
}

# What are the arguments to this function?


# What does the function return?


# What happens with the ...?



# Writing a function ------------------------------------------------------

df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))

df$b <- (df$b - min(df$b, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$b, na.rm = TRUE))

df$c <- (df$c - min(df$c, na.rm = TRUE)) / 
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))

df$d <- (df$d - min(df$d, na.rm = TRUE)) / 
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

# Start with a simple problem
x <- 1:5

rescale01 <- function(x){
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(x)


# Your turn: function that removes first element --------------------------

x <- 1:3

remove_last <- function(x){
  x[-length(x)]
}


# Iteration ---------------------------------------------------------------

# Your Turn: Remove repetition by writing a for loop

l <- list(a = rnorm(5),
          b = rnorm(5),
          c = rnorm(5),
          d = rnorm(5))
  
# l$a <- rescale01(l$a)
# l$b <- rescale01(l$b)
# l$c <- rescale01(l$c)
# l$d <- rescale01(l$d)

l_scaled <- vector("list", 4)
for(i in 1:4){
  l_scaled[[i]] <- rescale01(l[[i]])
}

l2 <- list(a = rnorm(5),
  b = rnorm(5),
  c = rnorm(5),
  d = rnorm(5))

l2_scaled <- vector("list", 4)
for(i in 1:4){
  l2_scaled[[i]] <- rescale01(l2[[i]])
}

l3 <- list(a = rnorm(5),
  b = rnorm(5),
  c = rnorm(5),
  d = rnorm(5))

l3_scaled <- vector("list", 4)
for(i in 1:4){
  l3_scaled[[i]] <- rescale01(l3[[i]])
}

l3_scaled

df[] <- df2

x <- l

rescale_cols <- function(x){
  output <- vector("list", length(x))
  for(i in seq_along(x)){
    output[[i]] <- rescale01(x[[i]])
  }
  output
}

rescale_cols(l)
rescale_cols(l2)
rescale_cols(l3)

compute_cols <- function(x, fun){
  output <- vector("list", length(x))
  for(i in seq_along(x)){
    output[[i]] <- fun(x[[i]])
  }
  output
}

compute_cols(l, rescale01)
compute_cols(l, mean)
compute_cols(l, range)

lapply(l, rescale01)
purrr::map(l, rescale01)


# sapply() and unstable types ---------------------------------------------

df <- data.frame(
  a = 1L,
  b = 1.5,
  y = Sys.time(),
  z = ordered(1)
)

A <- sapply(df[1:4], class) 
B <- sapply(df[3:4], class)

str(A)
str(B)


# Introducing map ---------------------------------------------------------

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

## Find the bmi of all people
as.numeric(luke[["mass"]]) / ((as.numeric(luke[["height"]]) / 100) ^ 2)

bmis <- map_dbl(people, 
  ~ as.numeric(.x[["mass"]]) / ((as.numeric(.x[["height"]]) / 100) ^ 2))

names(bmis) <- map_chr(people, "name")
sort(bmi)

# Where's Jabba?
bmis[["Jabba Desilijic Tiure"]]


# pipe operator -----------------------------------------------------------

## Find the number of characters in each film
map(films, ~ length(.x[["characters"]]))
map(films, "characters") %>% map_int(length)


## Which species have the most eye colors?
num_colors <- map_chr(species, "eye_colors") %>%
  strsplit(", ") %>%
  map_dbl(length) %>%
  set_names(map_chr(species, "name"))


# map2 --------------------------------------------------------------------

sampling_dist_mean <- function(n, pop_dist, n_sim = 1000, ...){
  colMeans(matrix(pop_dist(n = n * n_sim, ...), ncol = n_sim))
}

sampling_dist_mean(5, pop_dist = rnorm)
hist(sampling_dist_mean(5, pop_dist = rnorm))

# Use map to iterate over samples of size 2, 5, 10, 25 --------------------

ns <- c(2, 5, 10, 25)
sims <- map(ns, sampling_dist_mean, pop_dist = rnorm)

# Walk examples

walk(sims, hist)

walk(sims, hist, xlim = c(-3, 3))

walk(sims, hist, xlim = c(-3, 3)) %>% map_dbl(sd)


# Use map2 ----------------------------------------------------------------

dists <- c(rnorm, rexp, rnorm, rexp)
sims2 <- map2(ns, dists, sampling_dist_mean)


walk(sims2, hist)

# Fix to produce all combinations of sample size and distribution ----------

ns <- c(2, 5, 10, 25)
dists <- c(rnorm, rexp, rnorm, rexp)

sims2 <- map2(ns, dists, sampling_dist_mean)


ns <- rep(c(2, 5, 10, 25), 2)
dists <- rep(c(rnorm = rnorm, rexp = rexp), each = 4)
labels <- paste(names(dists), ns, sep = ":")
  
sims2 <- map2(ns, dists, sampling_dist_mean)

walk2(sims2, labels, ~ hist(.x, main = .y))



# safely() and transpose() -------------------------------------------------

urls <- list(
  example = "http://example.org",
  asdf = "http://asdfasdasdkfjlda"
)

map(urls, read_lines)

safe_readLines <- safely(readLines)
safe_readlines

# Use the safe_readLines() function with map(): html
html <- map(urls, safe_readLines)

# Call str() on html
str(html)

# Extract the result from the element that was successful
html[["example"]][["result"]]

# Extract the error from the element that was unsuccessful
html[["asdf"]][["error"]]

str(transpose(html))

# Extract the results: res
res <- transpose(html)[["result"]]

# Extract the errors: errs
errs <- transpose(html)[["error"]]


# END ---------------------------------------------------------------------


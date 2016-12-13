library(purrr)

# map2 --------------------------------------------------------------------

sampling_dist_mean <- function(n, pop_dist, n_sim = 1000, ...){
  colMeans(matrix(pop_dist(n = n * n_sim, ...), ncol = n_sim))
}

sampling_dist_mean(5, pop_dist = rnorm)
hist(sampling_dist_mean(5, pop_dist = rnorm))

# Use map to iterate over samples of size 2, 5, 10, 25 --------------------





# Walk to generate histograms ---------------------------------------------

walk(sims, hist)

# Can add other arguments through ...
walk(sims, hist, xlim = c(-3, 3))

# walk() returns .x, so you can use it in a pipeline
walk(sims, hist, xlim = c(-3, 3)) %>% map_dbl(sd)


# Exmaple of map2 ----------------------------------------------------------

dists <- c(rnorm, rexp, rnorm, rexp)

sims2 <- map2(ns, dists, sampling_dist_mean)

walk(sims2, hist)

# Fix to produce all combinations of sample size and distribution ----------

ns <- c(2, 5, 10, 25)
dists <- c(rnorm, rexp, rnorm, rexp)
sims2 <- map2(ns, dists, sampling_dist_mean)






# walk2() for labelled histograms -----------------------------------------

labels <- paste(names(dists), ns, sep = ":")

walk2(sims2, labels, ~ hist(.x, main = .y))




# purrr and list columns --------------------------------------------------

mtcars %>% 
  nest(-cyl) %>%
  mutate(
    fit = map(data, ~ lm(mpg ~ disp, data =.x)),
    slope = map_dbl(fit, ~ coef(.x)[2])
  )


# Iteration ---------------------------------------------------------------

# Your Turn: Remove repetition by writing a for loop

l <- list(a = rnorm(5),
  b = rnorm(5),
  c = rnorm(5),
  d = rnorm(5))

l$a <- rescale01(l$a)
l$b <- rescale01(l$b)
l$c <- rescale01(l$c)
l$d <- rescale01(l$d)









# Your Turn: Write a new function that finds the mean of each column ------

rescale_cols <- function(x){
  output <- vector("list", length(x))
  for(i in seq_along(x)){
    output[[i]] <- rescale01(x[[i]])
  }
  output
}



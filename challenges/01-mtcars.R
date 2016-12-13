# Many models challenge
library(purrr)

?mtcars

# Your Task ---
# Fit a regression model, of mpg against disp, for cars
# of the same number of cylinders. Then summarise those
# models using r^2 and the estimated slope.

# A list of data frames 
mtcars_by_cyl <- mtcars %>% split(mtcars$cyl)
mtcars_by_cyl

# Fit a regression model to each element 


# Extract R^2 from each regression model


# Extract the slope from each regression model
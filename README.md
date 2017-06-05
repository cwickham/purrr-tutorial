# A purrr tutorial

This repo hosts the materials for a [purrr](http://purrr.tidyverse.org/) tutorial.  The materials currently reflect the version planned for the useR! Brussels, Belgium, July 2017.

## Upcoming in-person tutorials

* [useR!](https://user2017.brussels/) Brussels, Belgium, July 4 2017
* [London R-ladies](https://www.meetup.com/rladies-london/) London, U.K., July 12 2017 

Older versions of the materials, from prior in-person tutorials, are also available:

* [Cascadia R Conf June 3 2017 (1.75 hours)](https://github.com/cwickham/purrr-tutorial/tree/v0.2) 

* [rstudio::conf Jan 2017 (2.25 hours)](https://github.com/cwickham/purrr-tutorial/tree/v0.1)


## Outline

Code with a lot of duplication is harder to understand, troubleshoot and maintain. The goal of this tutorial is help you remove duplication in your code by using functions that write `for` loops for you.

You'll learn to use the functions in the `purrr` package to perform iterative tasks: tasks that look like "for each _____ do _____".

By the end of the tutorial you'll be writing code that is more readable and easier to update and you'll be ready to solve new iteration problems faster and with fewer mistakes.

## Learning Objectives

By the end of the tutorial, you'll be able to:

* Move from solving a problem on a single element, to iterating that solution over many elements with `map()`.
* Identify when to use the typed variants of `map()`: `map_lgl()`, `map_int()`, `walk()` etc.
* Iterate over two arguments with `map2()`.
* Leverage `purrr` to get list data into tibbles.
* Use `purrr` to work with list columns in tibbles.

## Pre-requisites

Don't worry if you have never written a `for` loop, used `lapply()`, written your own function or heard of a `tibble`, this tutorial is designed to be accessible to beginners.  

That said, you should be familiar with exploring and subsetting the basic data structures in R including lists and data frames. 

This is a hands-on tutorial, you'll need your laptop with R installed, as well as a few packages:

```{r}
install.packages("tidyverse")

# install.packages("devtools")
devtools::install_github("jennybc/repurrrsive")
```

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/80x15.png" /></a><br />This <span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">purrr tutorial</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/cwickham/purrr-tutorial" property="cc:attributionName" rel="cc:attributionURL">Charlotte Wickham</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.

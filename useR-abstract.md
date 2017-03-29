---
title: "Solving iteration problems with purrr"
author: |
   | Charlotte Wickham^1^
   |
   | 1. Oregon State University
output: html_document
---

**Keywords**: purrr, tidyverse, tibble

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

This is a hands-on tutorial, you'll need your laptop with R and `purrr` installed. Check http://bit.ly/purrr-user17 closer to the date for more details.

## Instructor Info

Charlotte Wickham 

* [cwickham@gmail.com](cwickham@gmail.com)
* [cwick.co.nz](http://www.cwick.co.nz)
* @[cvwickham](http://www.twitter.com/cvwickham)


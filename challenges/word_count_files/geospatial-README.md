# geospatial

[![Travis-CI Build Status](https://travis-ci.org/cwickham/geospatial.svg?branch=master)](https://travis-ci.org/cwickham/geospatial)

An R package with the data sets used in the [DataCamp](www.datacamp.com) course [Working with Geospatial Data in R](https://www.datacamp.com/courses/working-with-geospatial-data-in-r). 

## Installation

`geospatial` isn't on CRAN but you can get it with:

```R
# install.packages("devtools")
devtools::install_github("cwickham/geospatial")
```

## Usage

Datasets in this package have the same names as those in the course.  For example, 
to replicate the very first plot in the first video:

```R
library(geospatial)
library(ggplot2)
?sales # Chapter 1 sales data
head(sales)

ggplot(sales, aes(lon, lat)) + 
  geom_point()
```

## Contents

This package contains the data sets corresponding to each chapter in the course
as listed below.

Chapter 1:

* `sales` - point data on sales in Corvallis
* `ward_sales` - sales summarized at the ward level
* `preds` - a grid of predictions over Corvallis

Chapter 2:

* `countries_sp`
* `countries_spdf`
* `tiny_countries_spdf`

Chapter 3:

* `pop`
* `pop_by_age`
* `prop_by_age`
* `migration`
* `land_cover` 

Chapter 4:

* `neighborhoods`
* `nyc_income`
* `water`
* `income_grid`

## Citations

If you use the data in this package please cite both this package and 
the original data source as listed in the relevant help file.

## Data generation

If you are interested in how the data sets were constructed you'll find the
scripts in the `data-raw` directory.

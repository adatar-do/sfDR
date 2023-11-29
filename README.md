
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sfDR <a href="https://adatar-do.github.io/sfDR/"><img src="man/figures/logo.png" align="right" height="120" alt="sfDR website" /></a>

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
![r-universe](https://adatar-do.r-universe.dev/badges/sfDR)
<!-- badges: end -->

The goal of sfDR is to provide a comprehensive suite of simple feature
(sf) objects for the administrative boundaries of the Dominican
Republic, facilitating geospatial analysis and mapping.

## Installation

You can install the development version of sfDR from r-universe with:

``` r
install.packages('sfDR', repos = c('https://adatar-do.r-universe.dev', 'https://cloud.r-project.org'))
```

## Example

This is a basic example showing how to use sfDR to plot a Dominican
Republic province map:

``` r
library(sfDR)

# Plotting the map of a specific province
plot(DR_PROV)
```


<!-- README.md is generated from README.Rmd. Please edit that file -->
mchtoolbox: Maternal Child Health Toolbox <img src="man/figures/imgHexSmall.png" align="right" />
=================================================================================================

[![Travis build status](https://travis-ci.com/ropenscilabs/mchtoolbox.svg?branch=master)](https://travis-ci.com/ropenscilabs/mchtoolbox) [![codecov](https://codecov.io/gh/ropenscilabs/mchtoolbox/branch/master/graph/badge.svg)](https://codecov.io/gh/ropenscilabs/mchtoolbox)

Use `mchtoolbox` to calculate percentiles and z-scores for a child’s sex and age for BMI, weight, height, and head circumference based on CDC growth charts.

### Motivation

Reference data from nationally representative populations is used in maternal and child health research and public health surveillance to calculate percentiles, z-scores, and related values. This is important for measures that naturally change over the lifespan, such as body mass index and blood pressure. It can be difficult to calculate these variables and incorporate them into a [tidy](https://www.tidyverse.org/) workflow because published code is often not available in the R language (or in any language), or in the same place. The motivation for this project is it create a package that contains functions compatible with the `tidyverse` to calculate commonly used measures in maternal child health. We are also working on a shiny app for EDA and so that users can easily load a CSV and calculate these measures in the app.

### Expected Input

`cdc_growth()` takes as input a data.frame with the following columns (**units**):

-   sex: 1=male, 2=female
-   agemos: months
-   height: cm
-   weight: kg
-   headcir: cm (optional)

Installation
------------

Install `mchtoolbox` from Github:

``` r
# install.packages("devtools")
devtools::install_github("ropenscilabs/mchtoolbox")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
## NHANES example data is included with package
create_cdc_growth(nhanes_data)
```

### Shiny App

![shiny\_screengrab](https://user-images.githubusercontent.com/7783352/40394166-2b00b14a-5dd7-11e8-9f62-88770d4e80db.png“)

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

### Project Origin

This project was begun during the [2018 rOpenSci unconference](unconf18.ropensci.org): <https://github.com/ropensci/unconf18/issues/49>

Contributors:

-   [Monica W. Gerber](https://github.com/monicagerber)
-   [Charles T. Gray](https://github.com/softloud)
-   [Jennifer Thompson](https://jenthompson.me/)
-   [Kyle Hamilton](http://kylehamilton.com/)
-   [Jenny Draper](https://www.esr.cri.nz)

A special thank you to:

-   [Maëlle Salmon](http://www.masalmon.eu/) for teaching us about `usethis`.
-   [Jenny Bryan](https://twitter.com/JennyBryan) for github resuscitation.

### Future Directions

-   Add all of the calculations in the original CDC SAS macro, including:
    -   Flagging for biologically implausible values
    -   headcir- and length/height-for-age calculations
    -   value-for-length calculations
    -   obesity measures (%bmip95)
-   Add functions for:
    -   weight-for-gestational age (child)
    -   gestational weight gain z score (maternal)
    -   blood pressure percentiles (child)

### Original Github Issue

[Link](https://github.com/ropensci/unconf18/issues/49) to original issue from unconf18.

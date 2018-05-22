
<!-- README.md is generated from README.Rmd. Please edit that file -->
mchtoolbox: Maternal Child Health Toolbox <img src="man/figures/imgHexSmall.png" align="right" />
==========
[![Travis build
status](https://travis-ci.com/ropenscilabs/mchtoolbox.svg?branch=master)](https://travis-ci.com/ropenscilabs/mchtoolbox)

### Project origin

This project was begun during the 2018 rOpenSci unconference: <https://github.com/ropensci/unconf18/issues/49>

### Original summary from @monicagerber

> Percentiles and z scores for BMI using the CDC reference charts (\[SAS program\] (<https://www.cdc.gov/nccdphp/dnpao/growthcharts/resources/sas.htm>)). I've found 1 package ([childsds](https://cran.r-project.org/web/packages/childsds/index.html)) that does this, but does not have all of the options as the SAS macro. Importantly, it doesn't calculate %BMIp95 (percent of the 95th percentile of BMI), which is being used more in obesity research. The [zscorer](https://nutriverse.validmeasures.org/zscorer/index.html) package only uses WHO growth charts. The CDC charts are standard in US pediatric obesity research. I have been in contact with the author of the SAS macro and he is very nice and fully supportive of turning this into an R package!

### expected input:

**units:**
* sex: 1=male, 2=female
* agemos: months
* height: cm
* weight: kg
* headcir: cm (optional)

Installation
------------

You can install mchtoolbox from github with:
```r
install.packages("devtools") 
devtools::install_github("ropenscilabs/mchtoolbox")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

```r   
## basic example code
```

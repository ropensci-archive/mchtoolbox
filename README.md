# mchtoolbox
Maternal Child Health Toolbox

## Overview

### Project origin
This project was begun during the [2018 rOpenSci unconference](unconf18.ropensci.org) ([issue 49](https://github.com/ropensci/unconf18/issues/49)).

### Original summary from @monicagerber

> Percentiles and z scores for BMI using the CDC reference charts ([SAS program] (https://www.cdc.gov/nccdphp/dnpao/growthcharts/resources/sas.htm)). I've found 1 package (childsds) that does this, but does not have all of the options as the SAS macro. Importantly, it doesn't calculate %BMIp95 (percent of the 95th percentile of BMI), which is being used more in obesity research. The zscorer package only uses WHO growth charts. The CDC charts are standard in US pediatric obesity research. I have been in contact with the author of the SAS macro and he is very nice and fully supportive of turning this into an R package!

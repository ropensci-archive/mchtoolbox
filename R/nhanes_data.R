#' National Health and Nutrition Examination Survey (NHANES) example dataset
#'
#' NHANES data.
#'
#' @format A dataframe.
#' @description Select data from the US National Health and Nutrition Examination Survey (NHANES). Taken from the NHANES package on CRAN, should only be used for educational purposes  https://cran.r-project.org/web/packages/NHANES https://www.cdc.gov/nchs/nhanes/index.htm
#' \describe{
#'   \item{cid}{Patient identifier.}
#'   \item{sex}{1 = male, 2 = female}
#'   \item{agemons}{Age in months.}
#'   \item{height}{Height in cm.}
#'   \item{weight}{Weight in kg.}
#'   \item{headcir}{Head circumference in cm.}
#' }
#' @import readr
"nhanes_data"

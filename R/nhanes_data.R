#' National Health and Nutrition Examination Survey (NHANES) example dataset
#'
#' NHANES data.
#'
#' @description Select data from the US National Health and Nutrition Examination Survey (NHANES). Taken from the NHANES package on CRAN, should only be used for educational purposes  https://cran.r-project.org/web/packages/NHANES
#' @format A data frame with 339 rows and 6 variables:
#' \describe{
#'   \item{cid}{Patient identifier.}
#'   \item{sex}{Sex of study participant coded as 1 = male, 2 = female}
#'   \item{agemons}{Age in months at screening of study participant.}
#'   \item{height}{Recumbent length in cm.}
#'   \item{weight}{Weight in kg.}
#'   \item{headcir}{Head circumference in cm.}
#' }
#' @source \url{https://www.cdc.gov/nchs/nhanes/about_nhanes.htm}
#' @references Centers for Disease Control and Prevention (CDC). National Center for Health Statistics (NCHS). National Health and Nutrition Examination Survey Data. Hyattsville, MD: U.S. Department of Health and Human Services, Centers for Disease Control and Prevention.
#' @import readr
#'
"nhanes_data"

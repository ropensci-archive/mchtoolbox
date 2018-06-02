#' Kilogram to pound conversion
#'
#' Converts between kilograms into pounds
#'
#' @return Converted value in pounds
#' @param kg weight in kilograms
#' @references NIST Guide to the SI, Appendix B.9: Factors for units listed by kind of quantity or field of science https://www.nist.gov/pml/nist-guide-si-appendix-b9-factors-units-listed-kind-quantity-or-field-science
#' @export
#' @examples
#' convert_kg_lbs(7.123)
#' #15.70352
#' convert_kg_lbs(c(7.836,7.432,6.921))
#' #17.27542 16.38475 15.25819


convert_kg_lbs <- function(kg) {
  return(kg/0.45359237)
}

#' Pound to kilogram conversion
#'
#' Converts between pounds into kilograms
#'
#' @return Converted value in kilograms
#' @param lbs weight in pounds
#' @references NIST Guide to the SI, Appendix B.9: Factors for units listed by kind of quantity or field of science https://www.nist.gov/pml/nist-guide-si-appendix-b9-factors-units-listed-kind-quantity-or-field-science
#' @export
#' @examples
#' convert_lbs_kg(7.123)
#' #3.230939
#' convert_lbs_kg(c(7.836,7.432,6.921))
#' #3.554350 3.371099 3.139313

convert_lbs_kg <- function(lbs) {
  return(lbs*0.45359237)
}

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "3.4.0")  utils::globalVariables(c("."))

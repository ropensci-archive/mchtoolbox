#' Launch mchtoolbox
#' @title Start the Shiny Interface for mchtoolbox
#' @return Nothing
#' @description startmavis starts loads the web browser an interactive user interface built using R shiny.
#' @details The purpose of building the interactive user interface is to provide an easy for people who are learning how to do their first meta-analysis and/or are not comfortable with the R command line system. Includes example data for testing out a meta-analysis.
#' @keywords mchtoolbox
#' @examples
#' \dontrun{
#' library(shiny)
#' lauch_mchtoolbox()
#' }
#' @export


launch_mchtoolbox <- function() {

  shiny::runApp(appDir = system.file("shiny", package="mchtoolbox"))

}

#' Launch mchtoolbox
#' @title Start the Shiny Interface for mchtoolbox
#' @return Nothing
#' @description lauch_mchtoolbox loads an interactive user interface built using R shiny.
#' @details The purpose of building the interactive user interface is to provide an easy method for people to use instead of the command line.
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

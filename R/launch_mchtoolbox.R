#' Launch Shiny interface for mchtoolbox
#' @title Start the Shiny Interface for mchtoolbox
#' @return Nothing
#' @description lauch_mchtoolbox loads an interactive user interface built using R shiny.
#' @details The purpose of building the interactive user interface is to provide an easy method for people instead of the command line.
#' @keywords mchtoolbox
#' @import shiny shinythemes ggplot2 dplyr viridisLite
#' @author W. Kyle Hamilton and Jennifer Thompson
#' @examples
#' \dontrun{
#' library(shiny)
#' lauch_mchtoolbox()
#' }
#' @export


launch_mchtoolbox <- function() {

  shiny::runApp(appDir = system.file("shiny", package="mchtoolbox"))

}

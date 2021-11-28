#' @title Run Shiny app for estimate_area function
#'
#' @description Runs an interactive Shiny app that allows the user
#'  adjust the inputs of the estimate_area() function.
#' @author Özgür Aydemir, Sophie La Gennusa, Louis del Perugia, Daniel Szenes, Francesca Darino
#' @return A \code{Shiny app} containing the following elements:
#'  \describe{
#'      \item{sidebarPanel}{Sidebar where one can input the number of points to simulate and the seed}
#'      \item{mainPanel}{A plot of the area, as well as textual output for the value of the area and the time of execution}
#' }
#' @export
runDemo <- function() {
  appDir <- system.file("shiny-examples", "area", package = "pkghw4g4")
  if (appDir == "") {
    stop(
      "Could not find example directory. Try re-installing pkghw4g4.",
      call. = FALSE
    )
  }

  shiny::runApp(appDir, display.mode = "normal")
}


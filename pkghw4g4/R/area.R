#' @title Define the contstraint of points
#'
#' @description This function is only necessary for the function estimate_area() because it defines the points
#' that are inside of the boundaries and than will be used to calculate the area of the shape
#' @return True or False
#' @author Özgür Aydemir, Sophie La Gennusa, Louis del Perugia, Daniel Szenes, Francesca Darino
#' @export point_constraint

point_constraint <- function(x) {
  x[1]^2 + x[2]^2 > 0.5^2 &
    (x[1] - 0.5) ^ 2 + (x[2] - 0.5) ^ 2 < (0.5 ^ 2) &
   x[2] > x[1] - 0.5
}


#' @title Computation of Specific area and Plotting The Coordinates
#'
#' @description Provide an approximation of the area of a Shape by using Monte Carlo Approach, with the function estimate_area(),
#' we can simulate coordinates of x and y , which are uniformly distributed between 0 and 1 according to the number that we write in the function.
#' At the end, we have an approximate area calculated by counting the number of points inside the shape divided by the total number of points.
#' @param B A \code{numeric} (integer) used to denote the number of coordinates for simulation.
#' @param seed A \code{numeric} used to control the seed of the random number
#' generator used by this function.
#' @return A \code{list} containing the following attributes:
#' \describe{
#'      \item{Estimated_area}{Estimated area of a shape}
#'      \item{points}{Coordinates of simulated points}
#' }
#' @author Özgür Aydemir, Sophie La Gennusa, Louis del Perugia, Daniel Szenes, Francesca Darino
#' @examples
#' estimate_area(B = 500, seed = 100)
#' @export estimate_area

estimate_area <- function(B = 5000, seed = 10){

  # Control seed
  set.seed(seed)

  # Simulate B points
  points <- data.frame(
    x = runif(n = B , min = 0, max = 1),
    y = runif(n = B, min = 0, max = 1),
    inside = rep(NA, B)
  )

  point_in_S = apply(points, 1, point_constraint)

  for (i in 1:nrow(points)) {

    if(point_in_S[i] == T){
      points$inside[i] = TRUE

    }else{
      points$inside[i] = FALSE
    }
  }
  area_hat = sum(point_in_S)/B
  # create a structure

  rval <- structure(
    list(
      estimated_area = area_hat,
      points = points),
    class = "area"
  )

  return(rval)
}


#' @title Plotting all the points generated inside the constraints
#'
#' @description Provides a graph with all the points generated inside the boundaries. It makes senses only when the output of a function
#' has an object named as "points". We are basically subsetting the output of estimate_area() with points as one of the output of
#' estimate_area() is called "points"
#' @return It basically return a graph with all the points inside the boundaries
#' @author Özgür Aydemir, Sophie La Gennusa, Louis del Perugia, Daniel Szenes, Francesca Darino
#' @examples
#' plot.area(estimate_area(B = 500, seed = 25))
#' @export plot.area


plot.area <- function(x){
  points <- subset(x[["points"]])

  points <- dplyr::filter(points, inside == TRUE)

  plot(points)
}




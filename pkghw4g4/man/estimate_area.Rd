% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/area.R
\name{estimate_area}
\alias{estimate_area}
\title{Computation of Specific area and Plotting The Coordinates}
\usage{
estimate_area(B = 5000, seed = 10)
}
\arguments{
\item{B}{A \code{numeric} (integer) used to denote the number of coordinates for simulation.}

\item{seed}{A \code{numeric} used to control the seed of the random number
generator used by this function.}
}
\value{
A \code{list} containing the following attributes:
\describe{
     \item{Estimated_area}{Estimated area of a shape}
     \item{points}{Coordinates of simulated points}
}
}
\description{
Provide an approximation of the area of a Shape by using Monte Carlo Approach, with the function estimate_area(),
we can simulate coordinates of x and y , which are uniformly distributed between 0 and 1 according to the number that we write in the function.
At the end, we have an approximate area calculated by counting the number of points inside the shape divided by the total number of points.
}
\examples{
estimate_area(B = 500, seed = 100)
}
\author{
Özgür Aydemir, Sophie La Gennusa, Louis del Perugia, Daniel Szenes, Francesca Darino
}

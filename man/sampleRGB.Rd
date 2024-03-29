% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sampleRGB.R
\name{sampleRGB}
\alias{sampleRGB}
\title{Interactive function to sample RGB value from pixel or square area in an image.}
\usage{
sampleRGB(image, resampleFactor = NULL, crop = c(0, 0, 0, 0), type = "point")
}
\arguments{
\item{image}{Image imported as a RasterStack.}

\item{resampleFactor}{Integer for downsampling used by \code{\link{redRes}}.}

\item{crop}{Vector c(xmin, xmax, ymin, ymax) that specifies the pixel coordinates to crop the
original image.}

\item{type}{Set 'point' to extract RGB from a single point or 'area' to extract from a square
area defined by setting two points (default = 'point').}
}
\value{
RGB vector
}
\description{
Interactive function to sample RGB value from pixel or square area in an image.
}
\examples{
image <- raster::stack(system.file("extdata", "BC0077.jpg", package = "patternize"))
RGB <- sampleRGB(image, resampleFactor = 1)

}

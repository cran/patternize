% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/makeList.R
\name{makeList}
\alias{makeList}
\title{Build list of landmarks or RasterStacks from images using filepath and file extension.}
\usage{
makeList(
  IDlist,
  type,
  prepath = NULL,
  extension = NULL,
  format = "imageJ",
  tpsFile = NULL,
  skipLandmark = NULL
)
}
\arguments{
\item{IDlist}{List of sample IDs.}

\item{type}{'landmark' or 'image' depending on what type of list to make.}

\item{prepath}{Prepath (default = NULL).}

\item{extension}{Extension (default = NULL).}

\item{format}{ImageJ (Fiji) or tps format (default = 'imageJ').}

\item{tpsFile}{Provide filename of tps file ff format is 'tps'.}

\item{skipLandmark}{Vector of rownumbers of landmarks to skip.}
}
\value{
Landmark or RasterStack list.
}
\description{
Build list of landmarks or RasterStacks from images using filepath and file extension.
}
\examples{
IDlist <- c('BC0077','BC0071','BC0050','BC0049','BC0004')

prepath <- system.file("extdata",  package = 'patternize')
extension <- '_landmarks_LFW.txt'

landmarkList <- makeList(IDlist, 'landmark', prepath, extension)

extension <- '.jpg'
imageList <- makeList(IDlist, 'image', prepath, extension)

}

#' Build landmark array for \code{\link[Morpho]{Morpho}}.
#'
#' @param sampleList List of landmark matrices as returned by \code{\link{makeList}}.
#' @param adjustCoords Adjust landmark coordinates in case they are reversed compared to pixel
#'    coordinates (default = FALSE).
#' @param imageList List of RasterStacks as returned by \code{\link{makeList}} should be given
#'    when \code{adjustCoords = TRUE}.
#' @param imageIDs A list of IDs to match landmarks to images if landmarkList and imageList don't
#'    have the same length.
#'
#' @return  X x Y x n array, where X and Y define the coordinates of the landmark points and n
#'    is the sample size.
#'
#' @examples
#'
#' \dontrun{
#' IDlist <- c('BC0077','BC0071','BC0050','BC0049','BC0004')
#'
#' prepath <- system.file("extdata",  package = 'patternize')
#' extension <- '_landmarks_LFW.txt'
#'
#' landmarkList <- makeList(IDlist, 'landmark', prepath, extension)
#'
#' landmarkArray <- lanArray(landmarkList)
#' }
#'
#' @export


lanArray <- function(sampleList,
                     adjustCoords = FALSE,
                     imageList = NULL,
                     imageIDs = NULL){

  # Make datastructure for Generailzed Procrustis Analysis
  for(n in 1:length(sampleList)){

    print(paste('sample', n,  names(sampleList)[n], 'added to array', sep=' '))

    # Read in landmark files and build array for Morpho
    landmarks <- sampleList[[n]]


    if(adjustCoords){
      if(is.null(imageList)){
        stop('For adjusting landmarkcoordinates, you should supply the image list')
      }

      if(is.null(imageIDs)){
        extPicture <- extent(imageList[[n]])
      }
      if(!is.null(imageIDs)){
        extPicture <- extent(imageList[[imageIDs[n]]])
      }

      landmarks[,2] <- (extPicture[4]-landmarks[,2])
    }

    if(n == 1){
      landmarksArray <- array(dim=c(nrow(landmarks),2,1), data=landmarks)
    }
    else{
      landmarksArray1 <- array(dim=c(nrow(landmarks),2,1), data=landmarks)
      landmarksArray  <- abind::abind(landmarksArray,landmarksArray1,along=3)
    }
  }
  return(landmarksArray)
}

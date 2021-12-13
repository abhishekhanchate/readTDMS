#' Data Stream Demeaner
#' @description The function aims to take a data stream in a vector form and returns the
#' demeaned data for further analysis. In short, the function calculates the mean of the
#' data and element-wise substracts it from the entire vector
#' @param datastream is a vector containing a one dimensional data stream
#' @return The function returns a vector containing the demeaned data stream
#' @export
#' @examples
#' # Load the installed library/package
#' library(readTDMS)
#' # Create or Import the data to be demeaned
#' data <- c(runif(150))
#' # Call the Function
#' demeaned_data <- demeaner(data)
demeaner <- function(datastream){
  # Checking for the Data Format
  dimm <- dim(datastream)
  if (!is.null(dimm)){
    stop(paste("The provided data stream cannot be demeaned since it is not a vector"))
  }
  # Demeaning the Data Stream
  demeaned_datastream <- datastream - mean(datastream)
  return(demeaned_datastream)
}

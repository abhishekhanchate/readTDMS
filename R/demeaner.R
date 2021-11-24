# Data Stream Demeaning Function - 18th Nov 2021 - Version 1
# Demeaning Function
#' @title Data Stream Demeaner
#' @description The function aims to take a data stream in a vector form and returns the
#' demeaned data for further analysis. In short, the function calculates the mean of the
#' data and element-wise substracts it from the entire vector
#' @param datastream is a vector containing a one dimensional data stream
#' @return The function returns a vector containing the demeaned data stream
#' @export
demeaner <- function(datastream){

  # Checking for the Data Format
  dimm <- dim(datastream)
  if (len(dimm) != 1){
    stop(paste("The provided data stream cannot be demeaned since it is not a vector"))
  }

  # Demeaning the Data Stream
  demeaned_datastream <- datastream - mean(datastream)

  return(demeaned_datastream)
}

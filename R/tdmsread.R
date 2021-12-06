# Data Stream (.tdms Format) Reading Function - 2nd Dec 2021 - Version 1
# Reading and Manipulating .tdms files Functions
#' @title Data Stream (.tdms Format) Reading Function
#' @description The function reads in an TDMS file as an input.
#' The destination/folder of the file must be specified and its associated
#' TDMS_Index file must be present in the same folder.
#' @param file_input is an TDMS file Input
#' @return The function returns a list containing:
#' \itemize{
#' \item datastream - A vector of data stream values based on the input TDMS file
#' \item timestamps - A vector of time stamps associated with the datastream based on the input TDMS file
#'}
#' @import tdmsreader
#' @export
tdmsread <- function(file_input){
  #library(tdmsreader)
  # Read in the TDMS File along with its destination
  file_input <- file('tests/file.tdms', 'rb')
  # Use the imported tdmsreader library to read the TDMS file
  main <- TdmsFile$new(file_input)
  # Extracting the First Channel and First Module in the TDMS file
  main$read_data(file_input, 0, 1)
  # Taking all streams associated with above specified Module and Channel
  r <- main$objects[[ "/'Untitled'/'Dev1/ai0'"]]
  # Extracting the Time stamps
  t <- r$time_track(start = 0, end = 1)
  # Extracting the Data stream values
  s <- r$data
  # Switching OFF function in case the Script runs based off a DAQ system
  dev.off()
  # Closing the TDMS file
  close(f)
  # Returns a list
  # datastream - A vector of data stream values
  # timestamps - A vector of time stamps/points
  return(list(datastream = s, timestamps = t))
}




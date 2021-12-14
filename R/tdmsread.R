#' Data Stream (.tdms Format) Reading Function
#' @description The function reads in an TDMS file as an input.
#' The destination/folder of the file must be specified and its associated
#' TDMS_Index file must be present in the same folder.
#' @param file_input is an TDMS file Input
#' @param plot is a boolean indicating if plotting is desired
#' @return The function returns a list containing:
#' \itemize{
#' \item datastream - A vector of data stream values based on the input TDMS file
#' \item timestamps - A vector of time stamps associated with the datastream based on the input TDMS file
#' \item summ - The summary of the extracted data stream
#'}
#' @import tdmsreader
#' @export
#' @examples
#' # Load the installed library/package
#' library(readTDMS)
#' # Open the TDMS File with specified path
#' f <- file('tests/file.tdms', 'rb')
#' # Call the Function to get the required plot
#' ans <- tdmsread(f)
#' # Datastream values
#' ans$datastream
#' # Timestamps
#' ans$timestamps
#' # Close the file if needed
#' # Note: For any changes and rerun of about function, we need to reopen the TDMS file
#' close(f)
tdmsread <- function(file_input, plot = TRUE){
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
  # Get the Summary Statistics of the Signal
  summ <- summary(s)
  if (plot == TRUE){
    # Plot a Line Plot representing the demeaned Signal
    img <- plot(s, t="l", main = "Time Domain Plot", xlab = "Timestamps/Samples", ylab = "Amplitude", col = "blue")}
  # Returns a list
  # datastream - A vector of data stream values
  # timestamps - A vector of time stamps/points
  return(list(datastream = s, timestamps = t, summ = summ))
}


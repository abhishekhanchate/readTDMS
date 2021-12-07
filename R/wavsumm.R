# Data Stream (.wav Format) Summary and Plotting Function - 20th Nov 2021 - Version 1
# file_input <- '~/D/Fall 2021 Courses/STAT600_STAT_Comp/example.wav'
#' @title Data Stream (.wav Format) Summary and Plotting Function
#' @description The function reads in an Wav file as an input and extracts the data stream from it. It
#' also calculations the summary of the data stream and plots it if specified.
#' @param file_input is an Wav file Input
#' @param plot A boolean which indicates if we want to plot the signal or not. It is TRUE by default.
#' @return The function returns a list containing:
#' \itemize{
#' \item summ - The summary of the extracted data stream
#' \item img - The plot of the data stream if plotting is specified as TRUE
#' }
#' @import tuneR
#' @export
wavsumm <- function(file_input, plot = TRUE){
  # Extract demeaned Signal from Data
  out <- wavread(file_input)
  data <- out$signal
  # Get the Summary Statistics of the demeaned Signal
  summ <- summary(data)
  # Check condition on plot and return a plot if needed
  if (plot == TRUE){
    # Plot a Line Plot representing the demeaned Signal
    img <- plot(data, t="l")
    return(list(summ = summ, img = img))
  }
  else{
    return(summ = summ)
  }
}


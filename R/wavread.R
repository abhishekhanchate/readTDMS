# Data Stream (.wav Format) Reading Function - 20th Nov 2021 - Version 1
# Reading and Manipulating .wav files Functions
# library(tuneR, warn.conflicts = F, quietly = T)
# Define Path to Audio File
# file_input <- '~/D/Fall 2021 Courses/STAT600_STAT_Comp/example.wav'
#' @title Data Stream (.wav Format) Reading Function
#' @description The function reads in an Wav file as an input.
#' @param file_input is an Wav file Input
#' @return The function returns a list containing:
#' \itemize{
#' \item data - A matrix or vector containing the data from the input .wav or Audio file
#' \item signal - A vector representing the extracted signal (demeaned)
#' \item samplingRate - A scalar corresponding to the Sampling Rate of the Signal
#' \item duration - A scalar corresponding to the Duration of the Signal
#'}
#' @import tuneR
#' @export
wavread <- function(file_input){
  # Extract Data from .wav File or Audio
  data <- readWave(file_input)
  # Determine Sample Rate
  fs = data@samp.rate
  # Extract Signal from Data
  out <- data@left
  # Demean the Data
  out_demeaned <- demeaner(out)
  # Determine Duration of the Signal
  dur <- length(out)/fs
  # Returns a list
  # data - A matrix or vector containing the data from the input .wav or Audio file
  # signal - A vector representing the extracted signal (demeaned)
  # samplingRate - A scalar corresponding to the Sampling Rate of the Signal
  # duration - A scalar corresponding to the Duration of the Signal
  return(list(data = data, signal = out_demeaned, samplingRate = fs, duration = dur))
}

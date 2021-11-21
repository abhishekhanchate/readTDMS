# Data Stream (.wav Format) Reading and Plotting Function - 20th Nov 2021 - Version 1
# Reading and Manipulating .wav foles Functions
library(tuneR, warn.conflicts = F, quietly = T)
# Define Path to Audio File
file_input <- '~/D/Fall 2021 Courses/STAT600_STAT_Comp/example.wav'
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

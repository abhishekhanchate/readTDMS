# Top Frequency Component Finder Function
#' @title Top Frequency Component Finder Function
#' @description The function reads in a TDMS file and generates its Fast Fourier Transform (FFT). For
#' the FFT calculation, we ignore the complex conjugates involved and only consider the Magnitudes of each
#' complex number. After finding the frequency components, it returns a list of top frequencies based on
#' specified n value
#' @param data is an TDMS file Input
#' @param frequencyPoints corresponds to the number of points for FFT
#' @param n corresponds to the number of Top Frequencies to be returned
#' @return a list of Top frequencies associated with the TDMS file data signal in the Frequency Domain
#' @import tdmsreader
#' @export
fftprofile <- function(data, frequencyPoints = 10000, n){
  ts <- tdmsread(data)
  ts_data <- ts$datastream
  data_fft <- fft(ts_data)
  amplitude <- Mod(data_fft[1:(length(data_fft)/2)])
  frequency <- seq(0, frequencyPoints, length.out=length(data_fft)/2)
  sorted <- sort.int(amplitude, decreasing=TRUE, index.return=TRUE)
  top <- sorted$ix[1:n] # indexes of the largest n components
  return (frequencies[top]) # convert indexes to frequencies
}

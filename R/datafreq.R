# Frequency Components Decomposition Function using the Fast Fourier Transform (FFT)
#' @title Frequency Components Decomposition Function
#' @description The function reads in a TDMS file and generates its Fast Fourier Transform (FFT). For
#' the FFT calculation, we ignore the complex conjugates involved and only consider the Magnitudes of each
#' complex number.
#' @param data is an TDMS file Input
#' @param frequencyPoints corresponds to the number of points for FFT
#' @return The function returns the plot of the TDMS file data signal in the Frequency Domain
#' @import tdmsreader
#' @export
datafreq <- function(data, frequencyPoints = 10000){
  ts <- tdmsread(data)
  ts_data <- ts$datastream
  data_fft <- fft(ts_data)
  # Ignore the 2nd half, which are complex conjugates of the 1st half,
  # and calculate the Mod (magnitude of each complex number)
  amplitude <- Mod(data_fft[1:(length(data_fft)/2)])
  # Calculate the frequencies
  frequency <- seq(0, frequencyPoints, length.out=length(data_fft)/2)
  # Plot!
  img <- plot(amplitude ~ frequency, t="l")
  # Return the Plot of TS data in the Frequency Domain
  return(img)
}

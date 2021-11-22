# Data Stream FFT Function - 21st Nov 2021 - Version 1
# FFT Function
# A vibration signal can be decomposed into its frequency components
# using the Fast Fourier Transform (FFT). Simply calling the R function fft
# returns data in an unfriendly format, but this function turns it into a more intuitive version
wavfft <- function(data, plot = TRUE){
  datafft <- fft(data)
  # Ignore the 2nd half, which are complex conjugates of the 1st half,
  # and calculate the Mod (magnitude of each complex number)
  amplitude <- Mod(datafft[1:(length(datafft)/2)])
  # Calculate the frequencies
  frequency <- seq(0, 10000, length.out=length(datafft)/2)
  # Check condition on plot and return a plot if needed
  if (plot == TRUE){
    # Plotting
    plot(amplitude ~ frequency, t="l")
    return(list(data_FFT = amplitude, frequency = frequency, img = img))
  }
  else{
    return(list(data_FFT = amplitude, frequency = frequency))
  }
}






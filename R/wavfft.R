# Data Stream FFT Function - 21st Nov 2021 - Version 1
# FFT Function
#' @title Data Stream FFT Function
#' @description This function decomposes the data stream into its frequency components using the
#' Fast Fourier Transform (FFT). Simply calling default FFT function in R does not give intuitive
#' results so this function also transforms the output we get
#' @param data is the data stream on which the FFT is applied
#' @param plot indicates whether the user wants to plot the data in the frequency domain or NOT. By default, it is TRUE
#' results in a plot representing the frequency domain of the data stream with various
#' frequency components
#' @return The function returns a list containing :
#'   \itemize{
#'   \item data_FFT - A vector of frequency components associated with the data stream
#'   \item frequency - A vector of frequencies associated with FFT on data stream
#'   \item img - A plot of the data in the frequency domain
#'}
#' @export
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
    img <- plot(amplitude ~ frequency, t="l")
    return(list(data_FFT = amplitude, frequency = frequency, img = img))
  }
  else{
    return(list(data_FFT = amplitude, frequency = frequency))
  }
}






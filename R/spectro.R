#' Data Stream Spectrogram Generator
#' @description The function aims to take a data stream in a vector form and based on the
#' other input parameters specified, i.e. n, Fs, window, overlap, dbON, returns a list
#' containing a vector of frequency components, time axis vector, frequency axis vector,
#' and a plot of the spectrogram
#' @param x is a vector containing a one dimensional data stream
#' @param n is a integer (dyadic preferred) specifying the number of nfft points
#' @param Fs is a integer specifying the sampling frequency
#' @param window specifies the size of window to use for generating and plotting spectrogram (in points)
#' @param overlap indicated the desired amount of overlap in the windowing process (in points)
#' @return The function returns a list containing :
#'   \itemize{
#'   \item freq_comps - A vector of normalized frequency components associated with the data stream
#'   \item timestamps - A vector of time stamps/points associated with the data stream spectrogram
#'   \item frequencystamps - A vector of frequency stamps/points associated with the data stream spectrogram
#'   \item spectro_img - A spectrogram plot with desired input parameters for the data stream
#'}
#' @import signal
#' @import ggplot2
#' @import oce
#' @export
#' @examples
#' # Load the installed library/package
#' library(readTDMS)
#' # Specify required parameters
#' n <- 1024
#' window <- 256
#' overlap <- 128
#' Fs <- 1000
#' # Create or Import the data to be demeaned
#' data <- c(runif(10000))
#' # Call the Function to get the required plot
#' ans <- spectro(x = data, n = n, Fs = Fs, window = window, overlap = overlap)
spectro <- function(x, n = 1024, Fs, window = 256, overlap = 128){
  # Demean the data stream vector
  x_demeaned <- demeaner(x)
  # Generate Spectrogram
  spec <- specgram(x = x_demeaned, n = n, Fs = Fs, window = window, overlap = overlap)
  # Get rid of Phase Information
  P <- abs(spec$S) # S is complex output of the FFT
  # Normalize the Values
  P <- P/max(P)
  # Convert to dB
  P <- 10*log10(P)
  # Config the Time Axis: the time indices corresponding to the columns of S
  t <- spec$t
  # Config the Frequency Axis: the frequency indices corresponding to the rows of S
  f <- spec$f
  # Plot the Spectrogram
  img <- imagep(x = t,
               y = f,
               z = t(P),
               col = oce.colorsViridis,
               ylab = 'Frequency [Hz]',
               xlab = 'Time [s]',
               drawPalette = T,
               decimate = F)
  # Returns a list
  # freq_comps - A vector of normalized frequency components
  # timestamps - A vector of time stamps/points
  # frequencystamps - A vector of frequency stamps/points
  # spectro_img - A spectrogram plot with desired input parameters
  return(list(freq_comps = P, timestamps = t, frequencystamps = f, spectro_img = img))
}


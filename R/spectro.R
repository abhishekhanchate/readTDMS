# Data Stream Spectrogram Function - 19th Nov 2021 - Version 1
# Signal Processing Functions
#library(signal, warn.conflicts = F, quietly = T)
# Image Plotting Functions and Nice Color Maps
#library(oce, warn.conflicts = F, quietly = T)
# Spectrogram Function
#' @title Data Stream Spectrogram Generator
#' @description The function aims to take a data stream in a vector form and based on the
#' other input parameters specified, i.e. n, Fs, window, overlap, dbON, returns a list
#' containing a vector of frequency components, time axis vector, frequency axis vector,
#' and a plot of the spectrogram
#' @param x is a vector containing a one dimensional data stream
#' @param n is a integer (dyadic preferred) specifying the number of nfft points
#' @param Fs is a integer specifying the sampling frequency
#' @param window specifies the type of window to use for generating and plotting spectrogram
#' @param overlap indicated the desired amount of overlap in the windowing process
#' @param dbON is a Boolean indicating if we want to convert to decibels or NOT
#' @return The function returns a list containing :
#'   \itemize{
#'   \item freq_comps - A vector of normalized frequency components associated with the data stream
#'   \item timestamps - A vector of time stamps/points associated with the data stream spectrogram
#'   \item frequencystamps - A vector of frequency stamps/points associated with the data stream spectrogram
#'   \item spectro_img - A spectrogram plot with desired input parameters for the data stream
#'}
#' @import signal
#' @import ggplot2
#' @export
spectro <- function(x, n, Fs, window, overlap, dbON){
  # Checks on dbON: Can only be 1 or 0
  if (dbON != 0 || dbON != 1){
    stop(paste("The parameter dbON can only take values 1 or 0"))
  }
  # Generate Spectrogram
  spec <- specgram(x = snd, n = nfft, Fs = fs, window = window, overlap = overlap)
  # Get rid of Phase Information
  P <- abs(spec$S)
  # Normalize
  P <- P/max(P)
  # Convert to dB if dbON = 1 and Ignore if dbON = 0
  if (dbON == 1){
    P <- 10*log10(P)
  }
  else{
    P <- P
  }
  # Config the Time Axis
  t <- spec$t
  # Config the Frequency Axis
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


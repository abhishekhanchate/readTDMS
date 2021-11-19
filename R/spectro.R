# Data Stream Spectrogram Function - 19th Nov 2021 - Version 1
# Signal Processing Functions
library(signal, warn.conflicts = F, quietly = T)
# Image Plotting Functions and Nice Color Maps
library(oce, warn.conflicts = F, quietly = T)
# Spectrogram Function
spectro <- function(x, n, Fs, window, overlap, dbON){
  # Checks on dbON: Can only be 1 or 0
  if (dbON != 0 || dbON != 1){
    stop(paste("The parameter dbON can only take values 1 or 0"))
  }
  # Generate Spectrogram
  spec <- specgram(x = snd, n = nfft, Fs = fs, window = window, overlap = overlap)
  # Get rid of Phase Information
  P = abs(spec$S)
  # Normalize
  P = P/max(P)
  # Convert to dB if dbON = 1 and Ignore if dbON = 0
  if (dbON == 1){
    P = 10*log10(P)
  }
  # Config the Time Axis
  t = spec$t
  # Config the Frequency Axis
  f = spec$f
  # Plot the Spectrogram
  img = imagep(x = t,
               y = f,
               z = t(P),
               col = oce.colorsViridis,
               ylab = 'Frequency [Hz]',
               xlab = 'Time [s]',
               drawPalette = T,
               decimate = F)

  return (spec)
}

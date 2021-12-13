# Frequency Components Decomposition Function using the Fast Fourier Transform (FFT)
#' @title Frequency Components Decomposition Function
#' @description The function reads in a TDMS file and generates its Fast Fourier Transform (FFT). For
#' the FFT calculation, we ignore the complex conjugates involved and only consider the Magnitudes of each
#' complex number.
#' @param file_input is an TDMS file Input
#' @param frequencyPoints corresponds to the number of points for FFT
#' @return The function returns the plot of the TDMS file data signal in the Frequency Domain
#' @import tdmsreader
#' @export
datafreq <- function(file_input, frequencyPoints = 10000, xlim1 = 0, xlim2 = 10000, ylim1 = -10, ylim2 = 500){

  # Use the imported tdmsreader library to read the TDMS file
  main <- TdmsFile$new(file_input)

  # Extracting the First Channel and First Module in the TDMS file
  main$read_data(file_input, 0, 1)

  # Taking all streams associated with above specified Module and Channel
  r <- main$objects[[ "/'Untitled'/'Dev1/ai0'"]]

  # Extracting the Time stamps
  t <- r$time_track(start = 0, end = 1)

  # Extracting the Data stream values
  ts_data <- r$data

  # FFT Calculation
  data_fft <- fft(ts_data)

  # Ignore the 2nd half, which are complex conjugates of the 1st half,
  # and calculate the Mod (magnitude of each complex number)
  amplitude <- Mod(data_fft[1:(length(data_fft)/2)])

  # Calculate the frequencies
  frequency <- seq(0, frequencyPoints, length.out=(length(data_fft)/2)-1)

  # Plot!
  img <- plot(amplitude ~ frequency, t="l", xlim = c(xlim1, xlim2), ylim = c(ylim1, ylim2))

  # Return the Plot of TS data in the Frequency Domain
  return(img)
}

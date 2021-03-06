#' Frequency Components Decomposition Function
#' @description The function reads in a TDMS file and generates its Fast Fourier Transform (FFT). For
#' the FFT calculation, we ignore the complex conjugates involved and only consider the Magnitudes of each
#' complex number.
#' @param file_input is an TDMS file Input
#' @param frequencyPoints corresponds to the number of points for FFT (by default = 10000) (scalar)
#' @param xlim1 specifies the lower limit for x-axis of the plot (by default = 0) (scalar)
#' @param xlim2 specifies the upper limit for x-axis of the plot (by default = 10000) (scalar)
#' @param ylim1 specifies the lower limit for y-axis of the plot (by default = -10) (scalar)
#' @param ylim2 specifies the upper limit for y-axis of the plot (by default = 500) (scalar)
#' @return The function returns a list containing :
#'   \itemize{
#'   \item data_FFT - A vector of frequency components associated with the data stream
#'   \item frequency - A vector of frequencies associated with FFT on data stream
#'   \item img - A plot of the TDMS file data signal in the frequency domain
#'}
#' @import tdmsreader
#' @importFrom stats fft
#' @export
#' @examples
#' # Load the installed library/package
#' library(readTDMS)
#' # Open the TDMS File with specified path
#' f <- file('~/readTDMS/vignettes/data/file.tdms', 'rb')
#' # Specify required parameters
#' frequencyPoints <- 5000
#' xlim1 <- -200
#' xlim2 <- 1200
#' ylim1 <- -10
#' ylim2 <- 400
#' # Call the Function to get the required plot
#' ans <- datafreq(f, frequencyPoints = frequencyPoints, xlim1 = xlim1, xlim2 = xlim2, ylim1 = ylim1, ylim2 = ylim2)
#' # Close the file if needed
#' # Note: For any changes and rerun of about function, we need to reopen the TDMS file
#' close(f)
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
  img <- plot(amplitude ~ frequency, t="l", xlim = c(xlim1, xlim2), ylim = c(ylim1, ylim2), main = "Frequency Domain Plot", xlab = "Frequency [Hz]", ylab = "Amplitude", col = "blue")
  # Return the Plot of TS data in the Frequency Domain
  return(list(freq_comps = amplitude, frequency = frequency, img = img))
}

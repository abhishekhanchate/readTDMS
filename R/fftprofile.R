#' Top Frequency Component Finder Function
#' @description The function reads in a TDMS file and generates its Fast Fourier Transform (FFT). For
#' the FFT calculation, we ignore the complex conjugates involved and only consider the Magnitudes of each
#' complex number. After finding the frequency components, it returns a list of top frequencies based on
#' specified n value
#' @param data is an TDMS file Input
#' @param frequencyPoints corresponds to the number of points for FFT (integer)
#' @param n corresponds to the number of Top Frequencies to be returned (integer)
#' @return a list/vector of Top frequencies associated with the TDMS file data signal in the Frequency Domain
#' @import tdmsreader
#' @importFrom stats fft
#' @export
#' @examples
#' # Load the installed library/package
#' library(readTDMS)
#' # Open the TDMS File with specified path
#' f <- file('~/readTDMS/vignettes/data/file.tdms', 'rb')
#' # Specify required parameters
#' frequencyPoints <- 10000
#' n <- 10
#' # Call the Function to get the top frequencies
#' ans <- fftprofile(f, frequencyPoints = frequencyPoints, n = n)
#' # Close the file if needed
#' # Note: For any changes and rerun of about function, we need to reopen the TDMS file
#' close(f)
fftprofile <- function(data, frequencyPoints = 10000, n){
  # Get the datastream from a TDMS file using tdmsread.R
  ts <- tdmsread(data)
  ts_data <- ts$datastream
  # FFT Calculation
  data_fft <- fft(ts_data)
  # Ignore the 2nd half, which are complex conjugates of the 1st half,
  # and calculate the Mod (magnitude of each complex number)
  amplitude <- Mod(data_fft[1:(length(data_fft) / 2)])
  # Calculate the frequencies
  frequency <- seq(0, frequencyPoints, length.out = (length(data_fft) / 2) - 1)
  # Sort the frequencies based on Amplitudes
  sorted <- sort.int(amplitude, decreasing = TRUE, index.return = TRUE)
  # Select the indices for the top n frequencies
  top <- sorted$ix[1:n] # indexes of the largest n components
  # Return the top n frequencies associated with the data stream from the TDMS file
  ans <- frequency[top] # convert indexes to frequencies
  return (ans)
}

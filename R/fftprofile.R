
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

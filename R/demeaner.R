# Data Stream Demeaning Function - 18th Nov 2021 - Version 1
# Demeaning Function
demeaner <- function(datastream){
  # Checking for the Data Format
  dimm <- dim(datastream)
  if (len(dimm) != 1){
    stop(paste("The provided data stream cannot be demeaned since it is not a vector"))
  }
  # Demeaning the Data Stream
  demeaned_datastream = datastream - mean(datastream)
  return(demeaned_datastream)
}

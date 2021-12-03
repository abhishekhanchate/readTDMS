# Data Stream (.tdms Format) Reading Function - 2nd Dec 2021 - Version 1
# Reading and Manipulating .tdms files Functions
tdmsread <- function(file_input){
  library(tdmsreader)
  file_input = file('tests/file.tdms', 'rb')
  main = TdmsFile$new(file_input)
  main$read_data(file_input, 0, 1)
  r = main$objects[[ "/'Untitled'/'Dev1/ai0'"]]
  t = r$time_track(start = 0, end = 1)
  s = r$data
  dev.off()
  close(f)
  return(list(datastream = s, timestamps = t))
}




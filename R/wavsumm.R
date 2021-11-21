# Data Stream (.wav Format) Summary and Plotting Function - 20th Nov 2021 - Version 1
file_input <- '~/D/Fall 2021 Courses/STAT600_STAT_Comp/example.wav'
wavsumm <- function(file_input, plot = TRUE){
  # Extract demeaned Signal from Data
  out <- wavread(file_input)
  data <- out$signal
  # Get the Summary Statistics of the demeaned Signal
  summ <- summary(data)
  # Check condition on plot and return a plot if needed
  if (plot == TRUE){
    # Plot a Line Plot representing the demeaned Signal
    img <- plot(data, t="l")
    return(list(summ = summ, img = img))
  }
  else{
    return(summ = summ)
  }
}





wavread


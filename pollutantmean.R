pollutantmean <- function(directory, pollutant, id=1:332) {
  # obtain list of sensor files in specdata directory
  filelist <- list.files(directory, full.names = TRUE)
  # subset list of sensor files
  objectivelist <- filelist[id]
  # apply several function to list using lapply
  x <- lapply(objectivelist, function(x) read.csv(x)[[pollutant]])
  y <- lapply(x, function(x) as.numeric(na.omit(x)))
  mean(unlist(y))
  }

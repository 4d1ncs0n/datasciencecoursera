complete <- function(directory, id = 1:332) {
  # obtain list of sensor files in specdata directory
  filelist <- list.files(directory, full.names = TRUE)
  # subset the list of sensor files
  objectivelist <- filelist[id]
  # apply several function to list using lapply
  x <- lapply(objectivelist, function(x) read.csv(x))
  y <- lapply(x, function(x) na.exclude(x))
  z <- lapply(y, function(y) length(y[["sulfate"]]))
  v <- as.numeric(z)
  w <- data.frame(id=id, nobs=v)
  w
}

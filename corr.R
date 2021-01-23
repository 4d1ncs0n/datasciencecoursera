corr <- function(directory, threshold = 0) {
  ## Obtain the list of sensor file exceeding the threshold
  x <- complete(directory)
  y <- x[x$nobs>threshold, ]
  ## Read the sensor files exceeding the threshold
  filelist <- list.files(directory, full.names = TRUE)
  thlist <- filelist[y$id]
  z <- lapply(thlist, function(x) read.csv(x))
  w <- lapply(z, function(x) na.exclude(x))
  a<-lapply(w, function(x) cor(x[["sulfate"]], x[["nitrate"]]))
  b<- unlist(a)
  b
  ## Process the list of sensor data frames by calculating
  ## number of complete cases, and if this number exceeds
  ## the threshold value passed to the function, calculate the correlation
  ## between nitrate and sulfate for the sensor
  
  ## Assemble the calculated correlations into a vector, and
  ## return the vector to the parent environment
}
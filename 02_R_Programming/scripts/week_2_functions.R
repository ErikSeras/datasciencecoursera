
# firs function
add2 <- function(x, y){
  x + y
}

add2(18,15)

# extract values greater than a value from a vector
above10 <- function(x){
  use <-x > 10
  x[use]
}

## Defauk
above <- function(x, n = 10){
  use <- x > n
  x[use]
}

x <- 1:20
above(x, 15)

## mean for column
columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y) ## number of columns
  means <- numeric(nc) ## vector with empty values
  for (i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

columnmean(airquality, TRUE)










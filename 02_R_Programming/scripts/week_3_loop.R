
## looping on the command line

## lapply (use for list)
## sapply (simplify the results
## apply (use for array)
## tapply (use for vector)
## maply (multivariate version of lapply)

## lapply

x <- list(
        a = 1:5,
        b = rnorm(10)
)

lapply(x, mean)


x <- 1:4
lapply(x, runif, min = 0, max = 10)

x <- list(
        a = matrix(1:4,2,2),
        b = matrix(1:6, 3,2)
)

## first column
lapply(x, function(elt) elt[,1])

x <- list(
        a = 1:4,
        b = rnorm(10),
        c = rnorm(20, 1),
        d = rnorm(100, 5)
)

lapply(x, mean)
sapply(x, mean)

## apply

a <- array(rnorm(2 *2 *10), c(2,2,10))
a
apply(a, c(1,2), mean)
rowMeans(a, dims = 2)

## mapply
mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd){
        rnorm(n, mean, sd)
}

rnorm(5,1,2)
noise(5,1,2)

mapply(noise, 1:5, 1:5, 2)

## tapply

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)

## split
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

head(airquality)

## average for each month
s <- split(airquality, airquality$Month)
s
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))


sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)

## I don't have to use the interaction function
## Use drop when I have 2 factor or more
str(split(x, list(f1, f2), drop = TRUE))

str(list(f1, f2))
split(x, f1)

# Debugging
## Warning
log(-1)

printmessage <- function(x){
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}
        
printmessage(NA)

x <- log(-1)
printmessage(x)

# Debugging Tools in R
## traceback
## debug
## browser
## trace
## recover

## traceback
mean(y)
traceback()

lm(y ~ x)
traceback()
## debug
debug(lm)
lm(y )

options(error = recover)
read.csv("nosuchfile")


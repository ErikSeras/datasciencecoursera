

x <- rnorm(100, 2, 4)
str(x)

y <- gl(2, 10)
y

z <- matrix(rnorm(100), 10,10)
str(z)

a <- split(airquality, airquality$Month)
str(a)

x <- rnorm(10, 20, 2)
x

set.seed(10)
rnorm(5)
rnorm(5)
rnorm(5)
rpois(10, 1)
rpois(10, 2)
rpois(10, 20)

## Cumulative distribution
ppois(2,2) ## Pr(x <= 2) 
ppois(4, 2)
ppois(6, 2)
################################################################################

set.seed(20)
x <- rnorm(100)
x
e <- rnorm(100, 0, 2)
y <- 0.5 +2 * x + e
summary(y)

plot(x, y)

set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
plot(x, y)

sample(1:100, 10)
sample(letters, 5)
sample(1:10)
sample(1:10, replace = TRUE)

system.time(readLines("http://www.jhsph.edu"))

hilbert <- function(n){
        i <- 1:n
        1 / outer(i -1, i, "+")
}
## vignette(package="parallel", topic = "parallel")


z <- hilbert(1000)
system.time(svd(z))

## library(parallel)
## library(MASS)
## detectCores()

system.time({
        n <- 1000
        r <- numeric(n)
        for(i in 1:n){
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})


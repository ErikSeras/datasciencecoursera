
direc <- getwd()
direc
ubic <- "/02_R_Programming/scripts"
dfile <- paste(direc, ubic, sep = "")
setwd(dfile)
getwd()



a <- c(0.5, 0.6)      ## numeric
b <- c(TRUE, FALSE)   ## logical
c <- c(T, F)          ## logical
d <- c('a', 'b', 'c') ## character
e <- 9:29             ## integer
f <- c(1+0i, 2+4i)    ## complex

g <- vector("numeric", length = 10)

h <- c(1.7, "a")      ## character
i <- c(TRUE, 2)       ## numeric
k <- c("a", TRUE)     ## character

l <- 0:6
class(l)
as.numeric(l)
as.logical(l)
as.character(l)



m <- matrix(1:6, nrow = 2, ncol = 3)   ## matrix, all numbers are inserted column by column
m
dim(m)
attributes(m)

## Another way to create an array
n <- 1:10
n
dim(n) <- c(2,5)
n

o <- 1:3
p <- 10:12
## 
cbind(o, p)

rbind(o,p)

q <- factor(c('yes', 'yes', 'no', 'yes', 'no'),
            levels = c('yes', 'no')) ## factors
q
table(q)
unclass(q)

## Missing values
r <- c(1,2,3,4,NA, NaN,10)
is.na(r)
is.nan(r)

## data frame

s <- data.frame(
  foo = 1:4,
  bar = c(T, T, F, F)
)
s
nrow(s)
ncol(s)

##
?sapply

##

t <- data.frame(a = 1, b = 'a')
t
dput(t, file = 't.R')
new.y <- dget("t.R")
new.y
## dump()

##
con <- url("http://www.jhsph.edu", "r")
co <- readLines(con)
length(co)

##

u <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"
u[[name]]
u$foo

##

v <- matrix(1:6, 2, 3)
v
v[1,2] # row and column
v[,2]
v[1,]
x <- v[1,2, drop = FALSE] # Show row and column in the result as array (matrix)

## Remove NA values
w <- c(1,2,NA, 4, NA, 5)
bad <- is.na(w)
bad
w[!bad]
##

airquality[1:6,]
class(airquality)
good <- complete.cases(airquality)
good
airquality[good, ][1:6,]

x <- 1:4
y <- 6:9
x + y


z <- 4L
class(z)

aa <- c(4, TRUE)
class(aa)

x <- c(1,3, 5)
y <- c(3, 2, 10)

z <-cbind(x, y)
z
class(z)

x <- c(1, 'a', F)
class(x)



x <- list(2, "a", "b", TRUE)
x[[2]]

x <- 1:4
y <- 2:3
class(x + y)
##

y <- c(3, 5, 1, 10, 12, 6)
x <- y 
x[x <= 5] <- 0
x











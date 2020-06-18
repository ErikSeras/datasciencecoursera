
## question 1
library(datasets)
data(iris)
?iris
head(iris)
s <- split(iris, iris$Species)
s
##There will be an object called 'iris' in your workspace. In this dataset,
## what is the mean of 'Sepal.Length' for the species virginica?
lapply(s, function(x) colMeans(x[, 1:4], na.rm = TRUE))

## question 2
## Continuing with the 'iris' dataset from the previous Question, what R code
## returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width',
## 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4],2, mean)

## question 3
library(datasets)
data(mtcars)
head(mtcars)

## equals
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)

## question 4
new <- tapply(mtcars$hp, mtcars$cyl, mean)
new
round(abs(new[3] - new[1]))



## question 5
## debug(ls)







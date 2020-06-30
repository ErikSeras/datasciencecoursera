set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x, y)

y <- rnorm(1:100, 40, 10)
x1 <- rnorm(1:100, 2, 5)
x2 <- rnorm(1:100, 20, 5)

library(datasets)
Rprof()

fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()


## Question 1
cube <- function(x, n){
        x^3
}

cube(3)

## Question 2
x <- 1:10
if(x>5){
        x <- 8
}

## Question 3

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

z <- 10
f(3)

## Question 4
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
y

## Question 5
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}


environment(h)


# Mal 2, 5 (no es d)
# 6(no es tipo especial de funcion)
# 7 (no es alcance dinamico)
# 8 (no es los valores de la variable libres se buscan en el entorno global)
# 10 (no es siempre es el entorno global)




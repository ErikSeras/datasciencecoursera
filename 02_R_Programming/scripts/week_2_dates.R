
x <- as.Date("1970-01-01")
print(x)
unclass(x)

unclass(as.Date("1970-01-02"))

x <- Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

## Convert string to date
## La configuracion de meses está en español (months in Spanish)
datestring <- c("Enero 10, 2012 10:40", "Diciembre 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x

## Arithmetic operations between dates
x <- as.Date("2012-01-01")
y <- strptime("9 Enero 2011 11:34:21", "%d %B %Y %H:%M:%S")
x <- as.POSIXlt(x)
x - y
y


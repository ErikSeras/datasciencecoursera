################################################################################
## Subseetting and Sorting

## Seed
set.seed(13435)

## Creación de un data frame
x <- data.frame(
        "var1" = sample(1:5),
        "var2" = sample(6:10),
        "var3" = sample(11:15)
)

x <- x[sample(1:5),]; x$var2[c(1,3)] = NA
x

## Uso de la lógica para seleccionar ciertas observaciones
x[x$var1 <= 3 & x$var3 > 11,]
x[x$var1 <= 3 | x$var3 > 15,]

## Ordenar una variable

sort(x$var1)
sort(x$var1, decreasing = TRUE)
sort(x$var2, decreasing = TRUE, na.last = TRUE)

## Ordenar por una variable todo el data frame
x[order(x$var1),]
x[order(x$var1, x$var2),]

## Este orden también se puede hacer con la librería plyr
library(plyr)

arrange(x, var1)
arrange(x, desc(var1))

## Añadir una nueva columna
x$var4 <- rnorm(5)
x

## Unir data frames
y <- cbind(x, rnorm(5))
y

################################################################################

# Summarizing Data

## btener data de una web

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"

download.file(fileUrl, destfile = "./03_getting_and_cleaning_data/data/restaurants.csv")

restData <- read.csv("./03_getting_and_cleaning_data/data/restaurants.csv")

## Eliminar las columnas demás
restData <- restData[,1:6]

head(restData, n = 3)
tail(restData, n = 3)

str(restData)
summary(restData)

## Quenatiles de variables quantitativas
quantile(restData$councilDistrict, na.rm = TRUE)

quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9))

## Hacer una tabla
## Contar las veces que se repite los valores de una variable
table(restData$zipCode, useNA = "ifany")

## Hacer un tabla de concilDistrict vs zipCode
table(restData$councilDistrict, restData$zipCode)

## Verificar los valores nulos
## Contar la cantidad de NA que hay
sum(is.na(restData$councilDistrict))

## Ver si hay algún valor nulo
any(is.na(restData$councilDistrict))

## Saber que todo es mayor a algo
all(restData$zipCode > 0)

## Sumar las columnas de una data frame
## se puede usar para saber cuantos valores nulos hay en un data frame
colSums(is.na(restData))

## Verificar si todas las variables no tienen valores nulos
all(colSums(is.na(restData)) == 0)

## Valores con características específicas
## Contar cuantas veces la varuabke zipCode es 21212
table(restData$zipCode %in% c("21212"))

## Contar cuantas veces la varuabke zipCode es 21213
table(restData$zipCode %in% c("21213"))

## Contar cuantas veces la variable zipCode es 21212 y 21213 juntos
table(restData$zipCode %in% c("21212", "21213"))

## Obtener las filas que tienen valores de la variable zipCode 21212 y 21213
restData[restData$zipCode %in% c("21212", "21213"),]

## Tablas cruzadas
data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)
summary(DF)

## Contar las frecuencias de los si fueron admitidos o no por sexo
## Usar esto cuando se tiene varias variables cualitativas
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt


str(warpbreaks)
warpbreaks$replicate <- rep(1:9, len = 54)

xt <- xtabs(breaks ~., data = warpbreaks)
str(xt)
ftable(xt)

## Tamaño de la data
fakeData = rnorm(1e5)
object.size(fakeData)
## Imprimir el tamaño de la variable creada en la memoria
print(object.size(fakeData), units = "Mb")

################################################################################

# Reshaping data
library(reshape2)

str(mtcars)

## Añadir una columna con los nombres de los carros
mtcars$carname <- rownames(mtcars)

## Crear un data frame que tiene como columnas carname, gear y cyk, pero las
## variables mpg y hp se han puesto como factores en una columna "variable"
## y en una columna "value" se pusieron sus valores que le corresponden
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt)
tail(carMelt)
summary(carMelt$variable)
str(carMelt)

## casting data frames
## Por defecto cuents valores de mpg y hp hay por cada cyl
cylData <- dcast(carMelt, cyl ~ variable)
cylData

## Calcula el promedio de mpg y hp por cada factor de cyl
cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

?mtcars

## Averaging values

str(InsectSprays)
## Contar las veces que se repite cada factor de la variable spray
tapply(InsectSprays$count, InsectSprays$spray, sum)

## Otra forma
spIns <- split(InsectSprays$count, InsectSprays$spray)
str(spIns)

sprCount <- lapply(spIns, sum)
sapply(spIns, sum)

str(sprCount)
unlist(sprCount)

## Another way

library(plyr)
ddply(InsectSprays, .(spray), summarize, sum = sum(count)) 

################################################################################
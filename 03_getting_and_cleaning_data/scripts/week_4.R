

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./03_getting_and_cleaning_data/data/cameras.csv",method="curl")
cameraData <- read.csv("./03_getting_and_cleaning_data/data/cameras.csv")
names(cameraData)

## Separa por puntos los nombres de las variables
splitNames <- strsplit(names(cameraData), "\\.")

splitNames[[1]]
splitNames[5][1]

mylist <- list(
        letters = c("A", "B", "C"),
        numbers = 1:3,
        matrix(1:25, ncol = 5)
)

mylist

splitNames[6][1]
splitNames[[6]][1]
splitNames

firstElement <- function(x){x[1]}
## Escoger el primer elemento de cada componente
## de la lista
sapply(splitNames, firstElement)


################################################################################

# Text variables

fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./03_getting_and_cleaning_data/data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./03_getting_and_cleaning_data/data/solutions.csv",method="curl")
reviews <- read.csv("./03_getting_and_cleaning_data/data/reviews.csv")
solutions <- read.csv("./03_getting_and_cleaning_data/data/solutions.csv")
head(reviews,2)
head(solutions,2)

##
testName <- "this_is_a_test"
## Eliminar el primer "_"
sub("_", "", testName)
## Elimiar todos los "_"
gsub("_", "", testName)

## Ubicar la fila en donde intersection tiene algún
## texto "Alameda" (retorna TRUE o FALSE)
grep("Alameda", cameraData$intersection)

##  Contar cuantas valores de intersection son tienen "Alameda"
table(grepl("Alameda", cameraData$intersection))

## ## Extraer todas las observaciones que no tenga en su valor
## de intersection la palabra "Alameda"
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection), ]

## Retorna las el valor de la variable intersection que
## tienen "Alameda"
grep("Alameda", cameraData$intersection, value = TRUE)


grep("JeffSteet", cameraData$intersection)

## Funciones de string
library(stringr)

nchar("Jeffrey Leek")

substr("Jeffrey Leek", 1, 7)
paste("Jeffrey", "Leek")

################################################################################

# Working with Dates

d1 <- date()
d1

## Año - mes - día
d2 <- Sys.Date()
d2

format(d2, "%a %b %d")
format(d2, "%A %B %d")

x <- c("1enero1960", "2febrero1960", "31marzo1960", "30julio1960")
z <- as.Date(x, "%d%B%Y")
z

as.numeric(z[2] - z[1])

weekdays(d2)
months(d2)
julian(d2)

library(lubridate)

ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
ymd_hms("2011-08-03 10:15:03")

## Hora con la zona horaria de Lima
ymd_hms("2011-08-03 10:15:03", tz = "America/Lima")

x <- dmy(c("1enero2013", "2enero2013", "31marzo2013", "30julio2013"))
## Saber que día es la fecha introducido
wday(x, label = TRUE, abbr = FALSE)
















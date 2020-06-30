

if(!file.exists("./03_getting_and_cleaning_data/data")){
        dir.create("./03_getting_and_cleaning_data/data")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./03_getting_and_cleaning_data/data/cameras.csv", method = "curl")


list.files("./03_getting_and_cleaning_data/data")
dateDownloaded <- date()
dateDownloaded

cameraData <- read.table("./03_getting_and_cleaning_data/data/cameras.csv",
                         sep = ",", header = TRUE)
cameraData <- read.csv("./03_getting_and_cleaning_data/data/cameras.csv")

head(cameraData)

## Para manejar archivos excel
## library(XLConnect)

## XML

## JSON
require(jsonlite)
fileUrl<-"https://api.github.com/users/jtleek/repos"
jsonData<-fromJSON(fileUrl)
names(jsonData)
names(jsonData$owner)

jsonData$owner$login

myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)

##
library(data.table)
DF = data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3),
                z = rnorm(9))
DT = data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3),
                z = rnorm(9))

head(DF)
head(DT)
tables()

DF[2,]
DT[2,]

DF[DF$y == "b",]
DT[DT$y == "b",]

DF[c(2,3),]
DT[c(2,3)]

DF[,c(2,3)]
DT[,c(2,3)]

{
        x = 1
        y = 2
}
k = {print("Se creó la variable k con valor 5"); 5}
print(k)

DT[, list(mean(x), sum(z))]
DT[, table(y)]

## Add z column
## Establecer copia
DT[, w := z^2]
DT[, m:={tmp <- (x + z); log2(tmp + 5)}]
DT[, a := x>0]
## Promedia los el vector resultado de la suma de x y w,
## el cual está agrupado por x >0 y x <= 0
DT[, b:=mean(x + w), by = a]

## Conteo total de las letras
set.seed(123);
DT <- data.table(x = sample(letters[1:3], 10E5, TRUE))
str(DT)
aa <- DT[, .N, by = x]
DT
str(aa)

## keys facilita la union de data.tables
DT <- data.table(x = rep(c("a", "b", "c"), each = 100), y = rnorm(300))
setkey(DT, x)
head(DT["a"])

## Union of data.table
DT1 <- data.table(x = c("a", "a", "b", "dt1"), y = 1:4)
DT2 <- data.table(x = c("a", "b", "dt2"), z = 5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)

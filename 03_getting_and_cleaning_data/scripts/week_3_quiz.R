
## Pregunta 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,
              "./03_getting_and_cleaning_data/data/ACS.csv",
              method = "curl")

ACS <- read.csv('./03_getting_and_cleaning_data/data/ACS.csv')

AgricultureLogical <- ACS$ACR == 3 & ACS$AGS == 6
head(which(AgricultureLogical), 3)

## Pregunta 2
library(jpeg)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,
              "./03_getting_and_cleaning_data/data/jeff.jpg",
              mode = "wb")

picture <- jpeg::readJPEG("./03_getting_and_cleaning_data/data/jeff.jpg",
                          native = TRUE)

quantile(picture, probs = c(0.3, 0.8))

## Pregunta 3
library(data.table)

## Download data and read FGDP data into data.table
FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=5
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
                          )

## Download data and read FGDP data into data.table
FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv')

## Unir los datos con el código de país

mergeDT <- merge(FGDP, FEDSTATS_Country, by = "CountryCode")

## Números de países que concidieron
nrow(mergeDT)

## Ordenar por rango de PIB
## y elegir el pais numero 13
mergeDT[order(-Rank)][13, .(Economy)]


## Pregunta 4

mergeDT[`Income Group` == "High income: OECD"
        , lapply(.SD, mean)
        , .SDcols = c("Rank")
        , by = "Income Group"]

mergeDT[`Income Group` == "High income: nonOECD"
        , lapply(.SD, mean)
        , .SDcols = c("Rank")
        , by = "Income Group"]

## Pregunta 5
library(dplyr)

breaks <- quantile(mergeDT[, Rank]
                   ,probs = seq(0, 1, 0.2), na.rm = TRUE)

mergeDT$quantileGDP <- cut(mergeDT[, Rank], breaks = breaks)
mergeDT[`Income Group` == "Lower middle income",
        .N, by = c("Income Group", "quantileGDP")]




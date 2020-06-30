
## Pregunta 1

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="./03_getting_and_cleaning_data/data/cameras.csv",method="curl")
cameraData <- read.csv("./03_getting_and_cleaning_data/data/cameras.csv")
names(cameraData)





























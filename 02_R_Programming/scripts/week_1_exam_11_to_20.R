direc <- getwd()
direc
ubic <- "/02_R_Programming/scripts"
dfile <- paste(direc, ubic, sep = "")
setwd(dfile)
getwd()

raw_data <- read.csv("../data/hw1_data.csv")
head(raw_data)
# In the dataset provided for this Quiz, what are the column names of the dataset?
names(raw_data)

# Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
raw_data[1:2,]

# How many observations (i.e. rows) are in this data frame?
dim(raw_data)

# Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(raw_data, 2)

# What is the value of Ozone in the 47th row?
raw_data[47, "Ozone"]

# How many missing values are in the Ozone column of this data frame?
l_na <- complete.cases(raw_data$Ozone)
n_na <- as.numeric(!l_na)
sum(n_na)

# What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(raw_data$Ozone[!is.na(raw_data$Ozone)])

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
data <- raw_data[(raw_data$Ozone > 31) & (raw_data$Temp >  90),]
mean(data$Solar.R[!is.na(data$Solar.R)])

# What is the mean of "Temp" when "Month" is equal to 6?
data_1 <- raw_data[raw_data$Month == 6,]
mean(data_1$Temp[!is.na(data_1$Temp)])

# What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
data_2 <- raw_data[raw_data$Month == 5,]
max(data_2$Ozone[!is.na(data_2$Ozone)])

# Cosas a mejorar en el examen
## 4
x <- 4L
class(x)

## 5
x <- c(4, TRUE)
class(x) ## numeric
## 7

## 8
## a character vector of lenght
## a character vector containin the letter "a"
x <- list(2, "a", "b", TRUE)
y <- x[[2]]
class(y)

## 9
x <- 1: 4
y <- 2: 3
x+y
class(x+y)

## 10
y <- c (17, 14, 4, 5, 13, 12, 10)
x <- y
## x[x > 10] <- 4














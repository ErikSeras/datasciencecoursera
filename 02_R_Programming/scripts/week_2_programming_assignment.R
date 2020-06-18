################################################################################

# R version 4.0.1 (2020-06-06)

# Files
## Columns
## Date: the date of the observation in YYYY-MM-DD format (year-month-day)
## sulfate: the level of sulfate PM in the air on that date
## (measured in micrograms per cubic meter)
## nitrate: the level of nitrate PM in the air on that date
## (measured in micrograms per cubic meter)

################################################################################

# Part 1
## Write a function named 'pollutantmean' that calculates the mean of
## a pollutant (sulfate or nitrate) across a specified list of monitors.

pollutantmean <- function(directory, pollutant, id = 1:332){
        ## averages of the pollutant values of each csv
        means <- c()
        for(i in id){
                ## csv file path
                file_dir <- paste(directory, sprintf("%03d", i), ".csv", sep = "")
                ## reading the csv file
                file_csv <- read.csv(file_dir, sep = ",")
                interested_data <- file_csv[pollutant]
                means <- c(means, interested_data[!is.na(interested_data)])
        }
        mean(means)
}

################################################################################
# setwd(directory)
# getwd()
# Example
directory <- 'D:/repositorios/datasciencecoursera/02_R_Programming/data/specdata/'
pollutant <- 'nitrate'
vid <- 1:332

pollutantmean(directory, pollutant)

################################################################################

# Part 2
## Write a function that reads a directory full of files and reports the number 
## of completely observed cases in each data file. The function should return a
## data frame where the first column is the name of the file and the second 
## column is the number of complete cases.

complete <- function(directory, id = 1:332){
        ## vector with ID values
        n_id <- c()
        ## vector with complete observations
        n_obs <- c()
        for(i in id){
                ## csv file path
                file_dir <- paste(directory, sprintf("%03d", i), ".csv", sep = "")
                ## reading the csv file
                file_csv <- read.csv(file_dir, sep = ",")
                ## vector with logical values
                vector_obs <- complete.cases(file_csv)
                ## sum of logical values
                obs <- sum(vector_obs)
                ## add ID
                n_id <- c(n_id, i)
                ## add complete observations
                n_obs <- c(n_obs, obs)
        }
        ## create final data frame
        final_data <- data.frame(
                "id" = n_id,
                "nobs" = n_obs
        )
        return(final_data)
}

################################################################################
# setwd(directory)
# getwd()
# Example

directory <- 'D:/repositorios/datasciencecoursera/02_R_Programming/data/specdata/'
id <- 30:25

set.seed(42)
cc <- complete(directory, 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

################################################################################

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        tcorr <- function(fname) {
                data <- read.csv(file.path(directory, fname))
                nobs <- sum(complete.cases(data))
                if (nobs > threshold) {
                        return (cor(data$nitrate, data$sulfate, use="complete.obs"))
                }
        }
        tcorrs <- sapply(list.files(directory), tcorr) #get all correlations + NULLs
        tcorrs <- unlist(tcorrs[!sapply(tcorrs, is.null)]) #remove NULLs
        return (tcorrs)
}



cr <- corr(directory, 2000)                
n <- length(cr)                
cr <- corr(directory, 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))







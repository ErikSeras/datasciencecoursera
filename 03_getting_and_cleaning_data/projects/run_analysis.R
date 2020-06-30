# Getting and Cleaning Data Project John Hopkins Coursera
### Erik Seras

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 1. Fusiona los conjuntos de entrenamiento y prueba para crear un conjunto de datos.
## 2. Extrae solo las mediciones de la media y la desviación estándar para cada medición.
## 3. Utiliza nombres descriptivos de actividades para nombrar las actividades en el conjunto de datos
## 4. Etiqueta adecuadamente el conjunto de datos con nombres de variables descriptivas.
## 5. A partir del conjunto de datos en el paso 4, crea un segundo conjunto de datos ordenado independiente con el promedio de cada variable para cada actividad y cada sujeto.

## Load Packages and get the Data
## Cargar paquetes y obtener los datos
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
path <- "./03_getting_and_cleaning_data/data/"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataSet.zip"))
unzip(zipfile = "./03_getting_and_cleaning_data/data/dataSet.zip") ## exdir no quiere ubicarse en otra dirección


## Load activity labels
## Cargar etiquetas de actividad
activityLabels <- fread(file.path("UCI HAR Dataset/activity_labels.txt")
                        ,col.names = c("classLabels", "activityName")) ## 6 obs, 2 variables

## Load activity features
## Cargar características de actividad
features <- fread(file.path("UCI HAR Dataset/features.txt")
                  , col.names = c("index", "featureNames")) ## 561 obs, 2 variables

## Extraer filas en que la variable featureNames tiene mean() o std() en su texto
featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames]) ## buscar mean() o std()
measurements <- features[featuresWanted, featureNames] ## 66 obs 
measurements <- gsub('[()]', '', measurements) ## eliminar () de cada observación

## Load train datasets
## Cargar conjunto de datos de entrenamiento
train <- fread(file.path("UCI HAR Dataset/train/X_train.txt"))[, featuresWanted, with = FALSE]
data.table::setnames(train, colnames(train), measurements) ## Renombrar las variables
trainActivities <- fread(file.path("UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("Activity")) ## 7352 obs, 1 variable
trainSubjects <- fread(file.path("UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("SubjectNum")) ## 7352 obs, 1 variable
train <- cbind(trainSubjects, trainActivities, train) ## 7352 obs, 68 variables

## Load test datasets
## Cargar conjuntpo de datos de prueba
test <- fread(file.path("UCI HAR Dataset/test/X_test.txt"))[, featuresWanted, with = FALSE]
data.table::setnames(test, colnames(test), measurements) ## Renombrar las variables
testActivities <- fread(file.path("UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("Activity")) ## 2947 obs, 1 variable
testSubjects <- fread(file.path("UCI HAR Dataset/test/subject_test.txt")
                      , col.names = c("SubjectNum")) ## 2947 obs, 1 variable
test <- cbind(testSubjects, testActivities, test) ## 2947 obs, 68 variables

## Merge datasets
## Unir conjunto de datos
combined <- rbind(train, test) ## 10299 obs, 68 variables

## Convert the variable "Activity" into a factor using activityLabels
## Convertir la variable "Activity" en un factor usando activityLabels
combined[["Activity"]] <- factor(
        ## Columna con valores de 1 a 5
        combined[, Activity]
        ## Columna con valores de 1 a 5
        , levels = activityLabels[["classLabels"]]
        ## Columna con texto que contienen etiquetas de cada valor de 1 a 5
        , labels = activityLabels[["activityName"]]
        )
## Convert the variable "SubjectNum" in a factor
## Convertir la variable "SubjectNum" en factor
combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])

## Modify "combined" in a data.frame of 679734 obs and 4 variables
## Modificar "combined" en una data.frame de 679734 obs y 4 variables
combined <- reshape2::melt(data = combined, id = c("SubjectNum", "Activity"))

## ## Get the average of each variable type of "combined" (180 obs and 68 variables)
## Obtener el promedio de cada tipo de variable de "combined" (180 obs y 68 variables)
combined <- reshape2::dcast(data = combined, SubjectNum + Activity ~ variable, fun.aggregate = mean)

## Create tidyData.txt
## crear tidyData.txt
write.table(x = combined, file = "./03_getting_and_cleaning_data/data/tidyData.txt", row.names = FALSE)

## Another way
## Otra forma
## data.table::fwrite(x = combined, file = "tidyData.txt", quote = FALSE)


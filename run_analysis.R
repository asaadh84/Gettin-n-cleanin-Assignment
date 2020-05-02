# 0 setting the scene
library(dplyr)

#Assigning a directory and downloading
if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# 1 Unzipping and getting the list of files
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files <- list.files(path_rf, recursive=TRUE)
files

# 2 Reading data into the variables
ytest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
ytrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
subject_train <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
subject_test  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
xtest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
xtrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)
features <- read.table(file.path(path_rf, "features.txt"),header = FALSE)
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

# 3 labeling the training and testing datasets (obj3)
colnames(xtrain) <- features[,2]
colnames(ytrain) <- "activityId"
colnames(subject_train) <- "subjectId"
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

# 4 Merging training and test datasets into dataset
training <- cbind(ytrain, subject_train, xtrain)
testing <- cbind(ytest, subject_test, xtest)
mergedtt <- rbind(training, testing)

# 5 Extracting the value of mean and standard deviation for each measurement
colNames <- colnames(mergedtt)
mean_std0 <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
Mean_Std <- mergedtt[ , mean_std0 == TRUE]

# 5 Using descriptive activity names to name the activities in the dataset [part of this is addressed in # 3. I kept that part of the code above as it served the purpose]
activity_names <- merge(Mean_Std, activityLabels, by='activityId', all.x=TRUE)

# 6 Creating & saving a new tidy dataset
second_Tidy <- aggregate(. ~subjectId + activityId, activity_names, mean)
second_Tidy <- second_Tidy[order(second_Tidy$subjectId, second_Tidy$activityId),]
write.table(second_Tidy, "second_Tidy.txt", row.name=FALSE)
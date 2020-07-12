# load dplyr
library(dplyr)
# get data from web
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")) {dir.create("./data")}
download.file(fileUrl, destfile = "./data/samsung.zip", method="curl")
unzip(zipfile = "samsung.zip", exdir = "./samsungUnzip")
setwd("./data/samsungUnzip")
#reading data into R
#preparing "features" and "activities"
feat <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n","features"))
act <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("n2","activities"))
# test datasets, using labels from "features" and "activities"
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = feat$features)
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "n2")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
#train datasets, using labels from "features" and "activities"
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = feat$features)
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "n2")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
#merge test and train datasets
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
sub <- rbind (subtrain, subtest)
all <- cbind(sub, y, x)
#extract measurements with mean and SD
select_mSD <- select(all, subject, n2, contains("mean"), contains("std"))
# name activities
select_mSD$n2 <- act[select_mSD$n2, 2]
#label dataset with descriptive variable names
names(select_mSD)[2] = "activities"
names(select_mSD) <- gsub("Acc", "Accelerometer", names(select_mSD))
names(select_mSD) <- gsub("BodyBody", "Body", names(select_mSD))
names(select_mSD) <- gsub("Gyro", "Gyroscope", names(select_mSD))
names(select_mSD) <- gsub("Mag", "Magnitude", names(select_mSD))
names(select_mSD) <- gsub("^t", "Time", names(select_mSD))
names(select_mSD) <- gsub("ˆf", "Frequency", names(select_mSD))
names(select_mSD) <- gsub("tBody", "TimeBody", names(select_mSD))
names(select_mSD) <- gsub("-freq()", "Frequency", names(select_mSD), ignore.case = TRUE)
#create tidy dataset with average of each variable
tidy <- group_by(select_mSD, subject, activities) %>%
        summarise_all(funs(mean))
write.table(tidy, "tidy.txt", row.name=FALSE)


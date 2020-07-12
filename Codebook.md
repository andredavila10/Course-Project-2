 # Getting and Cleaning Data Course Project
 ## This is the submission by Andre da Vila for the final project of the Getting and Cleaning Data course. The R Script contains instructions for the proposed task.
The data set used is the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), which contains the following files:
  1. **features.txt** - list of all features
  2. **activity_labels.txt** - links the class labels with their activity name
  3. **train/X_train.txt** - training set (one row - 1 measurement of 561 features)
  4. **test/X_test.txt** - test set
  5. **train/subject_train.txt** - each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
  6. **test/subject_test.txt** - subject for each measurement from the test set
  7. **train/y_train.txt** - training labels for each measurement from the train set
  8. **test/y_test.txt** - test labels

This **run_analysis.R** script performs the following tasks:
  1. **Download the dataset** : dataset downloaded and extracted under the folder called UCI HAR Dataset, under a "./data/samsungUnzip" folder

  2. **Assign each data to variables**
    feat <- features.txt : 561 rows, 2 columns
    The features selected for this database come from the accelerometer and gyroscope 3-axial raw     signals tAcc-XYZ and tGyro-XYZ, as described for the data set
    act <- activity_labels.txt : 6 rows, 2 columns
    List of activities performed when the corresponding measurements were taken and its codes (labels)
    subtest <- test/subject_test.txt : 2947 rows, 1 column
    contains test data of 9/30 volunteer test subjects being observed
    xtest <- test/X_test.txt : 2947 rows, 561 columns
    contains recorded features test data
    ytest <- test/y_test.txt : 2947 rows, 1 columns
    contains test data of activities’code labels
    subtrain <- test/subject_train.txt : 7352 rows, 1 column
    contains train data of 21/30 volunteer subjects being observed
    xtrain <- test/X_train.txt : 7352 rows, 561 columns
    contains recorded features train data
    ytrain <- test/y_train.txt : 7352 rows, 1 columns
    contains train data of activities’code labels
    
  3. **Merges the training and the test sets to create one data set**
    x (10299 rows, 561 columns) is created from the merger of xtrain and xtest using the rbind() function
    y (10299 rows, 1 column) is created from the merger of ytrain and ytest using the rbind() function
    sub (10299 rows, 1 column) is created from the merger of subtrain and subtest using the rbind() function
    all (10299 rows, 563 column) is created from the merger of sub, y and x using the cbind() function
    
  4. **Extracts only the measurements on the mean and standard deviation for each measurement**
    tidy (10299 rows, 88 columns) is created by subsetting all, selecting only columns: subject, n2 and the measurements on the mean and standard deviation (std) for each measurement
    
  5. **Uses descriptive activity names to name the activities in the data set**
    The number in n2 column of the tidy data set are replaced with corresponding activity taken from second column of the act data set, i.e. the activities column
    
  6. **Appropriately labels the data set with descriptive variable names**
    Columns in tidy data set are assigned the proper names which allow better description:
    All "Acc" in column’s name replaced by "Accelerometer"
    All "BodyBody" in column’s name replaced by "Body"
    All "Gyro" in column’s name replaced by "Gyroscope"
    All "Mag" in column’s name replaced by "Magnitude"
    All "tBody" in column’s name replaced by "TimeBody"
    All "-freq()" in column’s name replaced by "Frequency"
    All names starting with "f" in column’s name replaced by "Frequency"
    All names starting with "t" in column’s name replaced by "Time"
    
  7. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
    Creates new data indepentent data set for tidy (180 rows, 88 columns) from using group_by() function for grouping subject and activities and using summarise() function for taking means of each variable for each activity and each subject
    
  8. **Export FinalData into FinalData.txt file.**

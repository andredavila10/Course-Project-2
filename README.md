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

This repository contains the following files:
  1. **run_analysis.R** downloads and prepares the data, then carries out five tasks demanded by the project's instructions:
      a. Merges the training and the test sets to create one data set.
      b. Extracts only the measurements on the mean and standard deviation for each measurement.
      c. Uses descriptive activity names to name the activities in the data set
      d. Appropriately labels the data set with descriptive variable names.
      e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  2. **tidy.txt** is the final independent tidy data set produced by last step of run_analysis.R.
  3. **CodeBook.md** is the codebook describing the variables, the data, and steps performed to tidy up the data.
 

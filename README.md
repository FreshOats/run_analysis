# run_analysis.R
This is a program to run an analysis on UCI HAR data

This R Program utilizes data from the Univeristy of California, Irvine Repository 
for Machine Learning from the Human Activity Recognition Using Smartphones Data Set.
	This program utilizes the "dplyr" package, which is required. 
	This program also requires that the files from the UCI HAR Dataset are downloaded and unzipped in the working directory from: 
	
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	
	The full description of the data can be obtained at: 
	
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The process flow is as follows: 
1. Open and Acquire the labels for the data from /UCI HAR Dataset
2. Open and Acquire sets of data from ./UCI HAR Dataset/test and make df for TEST
3. Open and Acquire sets of data from ./UCI HAR Dataset/train and make df for TRAINING
4. Merge TEST and TRAINING data sets and replace variable names with meaningful names
5. Extract the means and standard deviations from each set
6. Change the variable names from each set to something meaningful that meets tidy data standards
7. Create new tidy data frames sorting by subject or activity
	The final datasets have 83 variables, and are organized as Wide Data, as described by Hadley Wickham. 
	The data observations are made of the 81 collected data variables for each of the 2 identifier variables, 
	subject and activity. Each combination of subject/activity represents one observation, for which there are 
	a total of 180 observations. 
	
	To meet the criteria of Tidy Data, each variable has its own column, and each column represents only one variable; 
	each different observation is in a different row; there is only one kind of variable represented in the presented table, 
	so there is only one table representing the data. 
	
	The variable names have been converted from jargon/abbreviations to meaningful labels, and all caps and various punctuation
	other than dots have been removed. 





## Part 1: Acquire Activity and Measurement Labels for the rows and columns
## open "dplyr" in the R Library
## Change allcaps format to all lowercase and then remove the underscores
## Open and read the features.txt to get the labels for measurements

library(dplyr)

ActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
ActivityLabels <- mutate(ActivityLabels, V2 = tolower(gsub("_", "", V2)))

MeasurementLabels <- read.table("./UCI HAR Dataset/features.txt")
MeasurementLabels <- mutate(MeasurementLabels, V1=V1+2)
newRows <- data.frame(V1=c(1:2), V2=c("subject", "activity"))
MeasurementLabels <- rbind(newRows, MeasurementLabels)


## Part 2: Acquire and manipulate TEST Data 
## Acquire the TEST Data using read.table to open files
## "Subject" is the identifier for each subject in the test.
## "Activity" is one of the six activities each subject performed
## "Measurements" is the set of data relating to each of the 561 measurements made
## Change the activity IDs in "Activity" to meaningful labels
## The tables are concatenated into one data frame called TestData

Subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Activity <- read.table("./UCI HAR Dataset/test/y_test.txt") 
Activity <- ActivityLabels$V2[Activity$V1]
Activity <- data.frame(Activity)
Measurements <- read.table("./UCI HAR Dataset/test/x_test.txt")

TestData <- data.frame(c(Subject, Activity, Measurements))


## Part 3: Acquire and Manipulate TRAINING Data
## Acquire the TRAINING Data using read.table 
## Again, Subject, Activity, and Measurements are used
## Activity ID is changed to meaningful all lowercase names
## The new data frame created is called TrainingData

Subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
Activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
Activity <- ActivityLabels$V2[Activity$V1]
Activity <- data.frame(Activity)
Measurements <- read.table("./UCI HAR Dataset/train/x_train.txt")

TrainingData <- data.frame(c(Subject, Activity, Measurements))


## Part 4: Merge Test and Training Sets, add meaningful column names

FullDataset <- merge(TrainingData, TestData, all = TRUE)


## Part 5: Extract Mean and Standard Deviation data for each set
## Extracting the Row numbers from the list of means and standard deviations
## Note: 2 columns are added to the front to account for the subject/activity columns

meanList <- grep("mean()", MeasurementLabels$V2)
stdList <- grep("std()", MeasurementLabels$V2)
labelsList <- sort(c(1, 2, meanList, stdList))
descriptiveData <- select(FullDataset, labelsList)



## Part 6: Change the names of the measurement data to meaningful Tidy labels. This 
utilizes the gsub function to substitute names. 

descriptiveList <- data.frame(labelsList)
descriptiveList <- rename(descriptiveList, V1 = labelsList)
descriptiveList <- merge(descriptiveList, MeasurementLabels, by.X=V1)

dList <- gsub("tBodyAcc", "body.accelerometer.", descriptiveList$V2)
dList <- gsub("tBodyGyro", "body.gyroscope.", dList)
dList <- gsub("Mag", "magnitude.", dList)
dList <- gsub("fBodyAcc", "fft.body.accelerometer.", dList)
dList <- gsub("fBodyGyro", "fft.body.gyroscope.", dList)
dList <- gsub("fBodyBodyAcc", "fft.body.accelerometer.", dList)
dList <- gsub("fBodyBodyGyro", "fft.body.gyroscope.", dList)
dList <- gsub("-", "", dList)
dList <- gsub("\\()", "", dList)
dList <- gsub("X", ".x", dList)
dList <- gsub("Y", ".y", dList)
dList <- gsub("Z", ".z", dList)
dList <- gsub("Freq", ".frequency", dList)
dList <- gsub("tGravityAcc", "gravity.accelerometer.", dList)
dList <- gsub("Jerk", "jerk.", dList)

colnames(descriptiveData) <- dList


## Part 7: Create new Tidy Dataframe with Average of each Variable for each Subject
## tidyData arranges the data by subject, where activityData arranges the data by activity. 

tidyData <- group_by(descriptiveData, subject, activity)
tidyData <- summarize_all(tidyData, mean)
activityData <- arrange(tidyData, activity, subject)

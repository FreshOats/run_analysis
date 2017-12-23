## 1. Open and Acquire the labels for the data from /UCI HAR Dataset
## 2. Open and Acquire sets of data from ./UCI HAR Dataset/test and make df for TEST
## 3. Open and Acquire sets of data from ./UCI HAR Dataset/train and make df for TRAINING
library(dplyr)


## Part 1: Acquire Activity and Measurement Labels for the rows and columns
## Change allcaps format to all lowercase and then remove the underscores
## Open and read the features.txt to get the labels for measurements

ActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
ActivityLabels <- mutate(ActivityLabels, V2 = tolower(gsub("_", "", V2)))

MeasurementLabels <- read.table("./UCI HAR Dataset/features.txt")
MeasurementLabels <- mutate(MeasurementLabels, V1=V1+2)
newRows <- data.frame(V1=c(1:2), V2=c("subject", "activity"))
MeasurementLabels <- rbind(newRows, MeasurementLabels)



## Part 2: Acquire and manipulate TEST Data 
## Acquire the TEST Data using read.table to open files
## Subject is the identifier for each subject in the test.
## Activity is one of the six activites each subject performed
## Measurements is the set of data relating to each of the 561 measurements made
## Change the activity IDs in "Activity" to meaningful labels
## The tables are concatenated into one dataframe called TestData

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
## The new dataframe created is called TrainingData

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



## Part 6: Change the names of the measurement data to meaningful Tidy labels
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

tidyDataprint <- write.table(./tidyData, filename = "tidyData.txt", row.names = FALSE)
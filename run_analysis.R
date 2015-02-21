##
## runAnalysis 
##
## This function will read data from a UCI HAR Dataset directory, merge
## the training and test datasets into one dataset, and extract the mean 
## and stddev of each measurement.  Function assumes that the 'UCI HAR Dataset'
## directory is in the getwd().
##
runAnalysis <- function() {
rootDirectoryName <- "UCI HAR Dataset"
runAnalysisStep1(rootDirectoryName)
}

runAnalysisStep1 <- function(rootDirectoryName) {
rootDirectoryName <- "UCI HAR Dataset"

## read the training data
subjectTrainData <- read.table(paste(rootDirectoryName, "/train/subject_train.txt", sep=""))
xTrainData <- read.table(paste(rootDirectoryName, "/train/X_train.txt", sep=""))
yTrainData <- read.table(paste(rootDirectoryName, "/train/Y_train.txt", sep=""))

## read the test data
subjectTestData <- read.table(paste(rootDirectoryName, "/test/subject_test.txt", sep=""))
xTestData <- read.table(paste(rootDirectoryName, "/test/X_test.txt", sep=""))
yTestData <- read.table(paste(rootDirectoryName, "/test/Y_test.txt", sep=""))

## the activity ids are in the first column of the y data 
xTrainData$Activity.ID <- yTrainData[,1]
xTestData$Activity.ID <- yTestData[,1]

## the subject ids are in the first column of the subject data 
xTrainData$Subject.ID <- subjectTrainData[,1]
xTestData$Subject.ID <- subjectTestData[,1]

## merge the data into one dataset by joining on the subject id
merge(xTrainData, xTestData, all=TRUE)
}
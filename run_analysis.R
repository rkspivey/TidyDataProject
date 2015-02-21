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
	mergedData <- runAnalysisStep1(rootDirectoryName)
	extractedData <- runAnalysisStep2(mergedData)
	extractedData$Activity.Label <- runAnalysisStep3(extractedData)
}

##
## runAnalysisStep1
##
## This function reads the training and test sets, and then 
## merges the training and the test sets to create one data set.
## The return value is the merged data set, with the column names 
## renamed to match the variable names in the features file.
runAnalysisStep1 <- function(rootDirectoryName) {
	## read the training data
	subjectTrainData <- read.table(paste(rootDirectoryName, "/train/subject_train.txt", sep=""))
	xTrainData <- read.table(paste(rootDirectoryName, "/train/X_train.txt", sep=""))
	yTrainData <- read.table(paste(rootDirectoryName, "/train/Y_train.txt", sep=""))

	## read the test data
	subjectTestData <- read.table(paste(rootDirectoryName, "/test/subject_test.txt", sep=""))
	xTestData <- read.table(paste(rootDirectoryName, "/test/X_test.txt", sep=""))
	yTestData <- read.table(paste(rootDirectoryName, "/test/Y_test.txt", sep=""))

	## read the features and rename columns in xTrainData and xTestData
	featuresData <- read.table(paste(rootDirectoryName, "/features.txt", sep=""))
	colnames(xTrainData) <- featuresData[,2]
	colnames(xTestData) <- featuresData[,2]

	## merge the activity ids in the first column of the y data with x
	xTrainData$Activity.ID <- yTrainData[,1]
	xTestData$Activity.ID <- yTestData[,1]

	## merge the subject ids in the first column of the subject data with x
	xTrainData$Subject.ID <- subjectTrainData[,1]
	xTestData$Subject.ID <- subjectTestData[,1]

	## merge the data into one dataset by joining on the subject id
	rbind(xTrainData, xTestData)
}

##
## runAnalysisStep2
##
## Extract only the mean and standard deviation measurements from mergedData.
## 
runAnalysisStep2 <- function(mergedData) {
	columnsToExtract <- grep("\\-mean\\(\\)|\\-std\\(\\)", colnames(mergedData))
	extractedData <- mergedData[,columnsToExtract]
	extractedData$Activity.ID <- mergedData$Activity.ID
	extractedData$Subject.ID <- mergedData$Subject.ID
	extractedData
}

## runAnalysisStep3
##
## Return vector of labeled activities for the mergedData activity ids.
##
runAnalysisStep3 <- function(rootDirectoryName, mergedData) {
	activityLabels <- read.table(paste(rootDirectoryName, "/activity_labels.txt", sep=""))
	activityLables[match(extractedData$Activity.ID, activityLables[,1]),2]
}


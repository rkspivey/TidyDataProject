This is a script that will read data from the UCI HAR Dataset and perform the following operation.

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    Output a tidy data set with the average of each variable for each activity and each subject.

The script is executed by running the runAnalysis() function.  
The script assumes that the "UCI HAR Dataset" data directory is already in the working directory.
The generated data will be stored in the working directory in the uciHarTidyDataset.txt file.
The generated data set is in a space-delimited format.  The first column is the subject ID, 
the second column is the activity, and the each column is the average value of that measurement for
that activity and subject.  The columns labeled -std() are not standard deviation measurements, but 
the average of the standard deviation for that particular measurement.


	
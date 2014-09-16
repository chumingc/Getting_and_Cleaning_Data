Getting and Cleaning Data Course Project (README)
=========================

This is a repository for the Getting and Cleaning Data Coursera course through Johns Hopkins University.

### Goal of the project
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set.
1. Appropriately labels the data set with descriptive activity names.
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### General procedures
* Dependency: package **dplyr** is required and can be installed as follow in RStudio:

		install.packages("dplyr")


* Download and unzip the data file into your local directory or folder, for example: "/Users/YourName/GettingAndCleaningData/Project/UCI HAR Dataset".

 	This can be done by either using utilities outside RStudio or inside RStudio as follows:

		setwd("/Users/YourName/GettingAndCleaningData/Project")

		fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

    	download.file(fileUrl, destfile="./UCI HAR Dataset.zip", method = "curl")

    	unzip("./UCI HAR Dataset.zip")

* Then put "run_analysis.R" script in the repository into "/Users/YourName/GettingAndCleaningData/Project/UCI HAR Dataset".
* In RStudio, run the script:
	
		source("run_analysis.R")

* The result file called "tidy_data_averages.txt" will be generated when the script is finished.
### Comments
* The details of how the "run_analysis.R" does can be found in the script itself and CodeBook.md file.

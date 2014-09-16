
Getting and Cleaning Data Course Project (CodeBook)
=========================


### Raw Data
The raw data can be found at: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The zip file contains data collected from the accelerometers from the Samsung Galaxy S smartphone. The files in the zip file are briefly described in the README.txt file in the directory after unzipping. A full description is available at:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data Cleanup
The "run_analysis.R" script performs the following work to clean up the raw data.

1. Merges the training and the test sets to create one data set.

	The training data set (train/X_train.txt) of 7352 instances by 561 features is merged with the test data set (test/X_test.txt) of 2947 instances by 561 features, the result is a 10299 by 561 data frame. 
	
	The 7352 training subjects (train/subject_train.txt) are merged with 2947 test subjects (test/subject_test.txt), the result is a 10299 by 1 data frame with subject IDs.

	The 7352 training labels (test/y_test.txt) are merged with  2947 test labels (test/y_test.txt_, the result is also a 10299 by 1 data frame with activity IDs.

1. Extracts only the measurements on the mean and standard deviation for each measurement.

	"features.txt" is used to extract only the measurements on the mean and standard deviation for each measurement. The result is a 10299 by 66 data frame.

1. Uses descriptive activity names to name the activities in the data set.

	The second column in the "activity_labels.txt" is transformed to some descriptive activity names and used to name the activities in the data set:

    "laying", 
    "sitting",
	"standing",
	"walking",
	"walking downstairs",
	"walking upstairs"

1. The 3 merged data sets above are combined together, the results is 10299 by 68 data frame. 

	The first column of the data frame is "subject", the second column is "activity", the rest of the columns are the 66 measurements. The feature names are also cleaned up by removing "()".

1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

	The **group_by()** and **summarise_each()** functions of "dplyr" package are used to create a new data set with the average of each feature for each activity and each subject. The result is a 180 by 68 data frame. The first column of the data frame is “subject”, the second column is “activity”. The rest of the columns are the 66 measurements on the mean and standard deviation for each measurement. There are total 30 subjects, each has 6 activities. Finally, this data frame is written out as a text file "tidy_data_averages.txt" using write.table() function with row.name=FALSE.



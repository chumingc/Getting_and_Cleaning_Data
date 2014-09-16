# UCI HAR project 
# The goal is to prepare tidy data that can be used for later analysis.

# This R script (run_analysis.R) does the following:

# Load in library 'dplyr'
library(dplyr)

# 1.Merges the training and the test sets to create one data set.

# Read in the traning set data.
data_train <- read.table("train/X_train.txt")

# Read in the test set data.
data_test <- read.table("test/X_test.txt")

# Merge the training and the test set data into one data set.
data <- rbind(data_train, data_test)

# Read in the training set labels 
labels_train <- read.table("train/y_train.txt")

# Read in the test set labels.
labels_test <- read.table("test/y_test.txt")

# Merge the training and the test set labels into one data set.
labels <- rbind(labels_train, labels_test)

# Read in the training subjects who performed the activity for each window sample.
subject_train <- read.table("train/subject_train.txt")

# Read in the test subjects who performed the activity for each window sample.
subject_test <- read.table("test/subject_test.txt")

# Merge the training and test subjects into one data set.
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Read in the list of all features.
features <- read.table("features.txt")

# Find the column names of the measurements on the mean and standard deviation for each measurement. 
selected_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

# Extracts only the measurements on the mean and standard deviation for each measurement.
data <- data[, selected_features]


# Remove the "()" from the column names. 
names(data) <- features[selected_features, 2]
names(data) <- gsub("\\(|\\)", "", names(data))

# 3. Uses descriptive activity names to name the activities in the data set.

# Read in the labels for activity names.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", " ", tolower(as.character(activities[, 2])))
labels[,1] = activities[labels[,1], 2]

# 4. Appropriately labels the data set with descriptive activity names.
names(labels) <- "activity"

cleaned <- cbind(subject, labels, data)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

cleaned_avg <- cleaned %>% group_by(subject, activity) %>% summarise_each(funs(mean))

write.table(cleaned_avg, row.names = F, "tidy_data_averages.txt")

require(plyr)

## 1st Goal: Merges the training and test sets to create one data set.

# Read the training data from the files (features, activity  and subjects)
train_features <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
train_activities <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
train_subjects <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")

# Read the test data from the files (features, activity and subjects)
test_features <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt")
test_activities <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
test_subjects <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")

# Read features descriptions and activities labels 
features <- read.table("./UCI\ HAR\ Dataset/features.txt")
activity_labels <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt")

# Binding the train & test data: features, labels and subjects
merged_features <- rbind(train_features,test_features)
merged_activities <- rbind(train_activities,test_activities)
merged_subjects <- rbind(train_subjects,test_subjects)

# Set the names of the columns
names(merged_features) = features[[2]]
names(merged_activities) = c("ActivityId")
names(merged_subjects) = c("Subject")

# Create one complete dataset binding all data frames
complete_measures = cbind(cbind(merged_subjects, merged_activities), merged_features)

## 2nd Goal: Extracts only the measurements on the mean and standard deviation for each measurement. 

# Filtering column by the indices to obtain a dataset with only mean a std measurements
filtered_std_mean_measures <- complete_measures[,grepl("mean|std|Subject|ActivityId", names(complete_measures))]


## 3rd Goal: Uses descriptive activity names to name the activities in the data set

# Prepare column names for activities 
names(activity_labels) = c("ActivityId","Activity")

# Applying activity description by IDs with the merge function
filtered_std_mean_measures <- merge(activity_labels, filtered_std_mean_measures, "ActivityId")

# Delete column with ActivityID 
filtered_std_mean_measures <- filtered_std_mean_measures[ ,-1]


## 4th Goal: Appropriately labels the data set with descriptive variable names. 

# Remove parenthesis, dots and minus signs
names(filtered_std_mean_measures) <- gsub("\\(\\)","",names(filtered_std_mean_measures))
names(filtered_std_mean_measures) <- gsub("-","",names(filtered_std_mean_measures))
names(filtered_std_mean_measures) <- gsub("\\.","",names(filtered_std_mean_measures))

# Capital letters for mean and std 
names(filtered_std_mean_measures) <- gsub("std","Std",names(filtered_std_mean_measures))
names(filtered_std_mean_measures) <- gsub("mean","Mean",names(filtered_std_mean_measures))

# Identify time a frequency domains
names(filtered_std_mean_measures) <- gsub('^t',"Time",names(filtered_std_mean_measures))
names(filtered_std_mean_measures) <- gsub('^f',"Frequency",names(filtered_std_mean_measures))

# We should avoid unknown acronymus but also avoiding, if possible, labels too long (we complete some acronymus...)
names(filtered_std_mean_measures) <- gsub('Acc',"Acceleration",names(filtered_std_mean_measures))
names(filtered_std_mean_measures) <- gsub('Mag',"Magnitude",names(filtered_std_mean_measures))
names(filtered_std_mean_measures) <- gsub('Gyro',"Gyroscope",names(filtered_std_mean_measures))

## 5th Goal: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Create and aggregated data set with the mean of each measurement by subject and activity
# Using ddply function from package plyr
avg_by_subjects_activities = ddply(filtered_std_mean_measures, c("Subject","Activity"), numcolwise(mean))

# write dataset to file
write.table(avg_by_subjects_activities, "avg_by_subjects_activities.txt",row.name=FALSE)

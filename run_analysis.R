rm(list=ls())

library(dplyr)
library(tidyr)

## read the training and test data sets
dir="C:/Users/dk/Documents/Coursera/Data science/GettingCleaningData/UCI HAR Dataset/"

setwd(dir)

features=read.table("features.txt")
colnames(features)=c("varID", "variable")

activity_labels=read.table("activity_labels.txt")
colnames(activity_labels)=c("activityID", "activity")

# Read training set
X_train=read.table("train/X_train.txt")
y_train=scan("train/y_train.txt", quiet=T)
subject_train=scan("train/subject_train.txt", quiet=T)
# colnames(X_train)=features$variable

# Read test set
X_test=read.table("test/X_test.txt")
y_test=scan("test/y_test.txt", quiet=T)
subject_test=scan("test/subject_test.txt", quiet=T)
# colnames(X_test)=features$variable

## 1. Merge the training and the test sets to create one data set. ####
# Merge the variables related to training
all_train=cbind(subject_train, y_train, X_train)
all_train=all_train %>%
    rename(participantID=subject_train, activityID=y_train)
# Merge the variables related to test
all_test=cbind(subject_test, y_test, X_test)
all_test=all_test %>%
    rename(participantID=subject_test, activityID=y_test)

# merge the training and test dataset
train_test_set=rbind(all_train, all_test)

## 2. Extract only the measurements on the mean and standard deviation for each measurement. ####
# Find which variables are for mean and standard deviation
mean_std_vars=sort(c(grep("mean()", features$variable, fixed=T), grep("std()", features$variable)))
# The first two columns of the combined dataset are not the features, hence 2 should be added to mean_std_vars
train_test_mean_std=train_test_set %>%
    select(1, 2, (2+mean_std_vars)) 

## 3. Use descriptive activity names to name the activities in the data set ####
# add the activity label
train_test_activity=merge(activity_labels, train_test_mean_std, by="activityID", all=T) %>%
    select(-activityID)

## 4. Appropriately label the data set with descriptive variable names. ####
cnames=c("activity", "participantID", features[mean_std_vars, "variable"])
colnames(train_test_activity)=cnames

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. ####
grouped_data = train_test_activity %>%
    group_by(activity, participantID) %>% 
    summarise_all(mean)

## create output
write.table(grouped_data, "Assignment_Output.csv", sep=",", col.names=T, row.names=F, quote=F)

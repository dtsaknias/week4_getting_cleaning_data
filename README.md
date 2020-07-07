# Readme
This is the assignment for Week 4 from the Coursera course Getting &amp; Cleaning Data

This file explains how the script 'run_analysis' works.

Lines 1-37: We read the training dataset and combine the file with the measurements (X_train), with the activity (Y_train) and the partcipantID (subject_train).
We repeat the same steps for the test dataset.

Lines 39-40: We combine the training and test datasets by concatenating them (rbind function).

Lines 42-47: We find out which variables are related to the mean and standard deviation and we keep only those ones. Note that there is a variable called 'meanFreq', but it is not selected.

Lines 49-52: We use the activity labels to give descriptive activity names.

Lines 54-56: We rename the columns of the combined dataset in order to give descriptive names to the variables.

Lines 58-61: Group the dataset by subject and activity and get the mean of each variable by using the function 'summarise_all'

Finally, output the table from step 5 (called Assignment_Output.csv).

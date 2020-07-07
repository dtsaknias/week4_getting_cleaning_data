This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

For each record it is provided:
=============
- The activity for which the analysis was performed. These are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.  
- An identifier of the subject who carried out the experiment.  
- The mean values of the mean and standard deviation of the measurements for the variables of:  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. These are measured in standard gravity units 'g'.  
- Triaxial Angular velocity from the gyroscope. The units are radians/second.   
  

Data transformation:
=========================================
The steps that were followed are:

1. Read the training dataset and combine the file with the measurements (X_train), with the activity (Y_train) and the partcipantID (subject_train). Repeat the same steps for the test dataset.

2. Combine the training and test datasets by concatenating them (rbind function).

3. Find out which variables are related to the mean and standard deviation and we keep only those ones. Note that there is a variable called 'meanFreq', but it is not selected.

4. Use the activity labels to give descriptive activity names.

5. Rename the columns of the combined dataset in order to give descriptive names to the variables.

6. Group the dataset by subject and activity and get the mean of each variable by using the function 'summarise_all'



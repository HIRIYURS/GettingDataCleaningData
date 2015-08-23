# GettingDataCleaningData
##Project work for Getting Data and Cleaning Data under Signature Track.

###Step by Step instructions to setup this project on your machine,
1. Download the data files (.zip file) from the url - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Extract the zip file in to the current directory. This will create a directory by name, "UCI HAR Dataset"
4. Download the run_analysis.R file from this project to your current working directory
5. Open your R console or R Studio and set the working directory (using setwd() function)to above working directory where you have placed the run_analysis.R and the "UCI HAR Dataset" folder(directory)
6. Source the run_analysis.R file to run the script

The script run_analysis.R does the following,
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Detailed logic of the run-analysis script
The detailed description of the run_analysis script logic has been provided below,
1. Read the Features and Activity Labels 
	- UCI HAR Dataset/features.txt
	- UCI HAR Dataset/activity_labels.txt

2. Read the Training data - Subject, Lables, Training features data
	- UCI HAR Dataset/train/subject_train.txt
	- UCI HAR Dataset/train/y_train.txt
	- UCI HAR Dataset/train/X_train.txt

3. Read the Test data -  - Subject, Lables, Training features data
	- UCI HAR Dataset/test/subject_train.txt
	- UCI HAR Dataset/test/y_train.txt
	- UCI HAR Dataset/test/X_train.txt

4. Set the Column names
	- Activity for Labels
	- Subject for Subject
	- Transpose the 2nd column in Features.txt file into Column names 
	  (Variable) of the features data set 

5. As per the Step 1 of the project work requirement
	- Step 1: Merges the training and the test sets to create one data set.
                  Merge Subject, Activity Labels and Features for both test and training

6. As per the Step 2 of the project work requirement
	- Step 2: Extracts only the measurements on the mean and standard
                  deviation for each measurement.

7. As per the Step 3 of the project work requirement
	- Step 3: Uses descriptive activity names to name the activities in the data set
                  Replace the Activity Label ID (1-6) with actual Activity Lables from 
                  activity_labels.txt file

8. As per the Step 4 of the project work requirement
	- Step 4: Appropriately labels the data set with descriptive variable names. 
		  Acc to Accelerometer
		  Gyro to Gyroscope
    		  BodyBody to Body
		  Mag to Magnitude
		  The ones beginning with t (^t) to Time
		  The ones beginning with f (^f) to Frequency
		  tBody to TimeBody
		  -mean() to Mean
		  -std() to STD
		  -freq() to Frequency
		  angle to Angle
		  gravity to Gravity

9. As per the Step 5 of the project work requirement
	- Step 5: From the data set in step 4, creates a second, independent tidy data 
	          set with the average of each variable for each activity and each subject.
	- use aggregate function from data.table library 

10. Use aggregate function to compute the averages of each varaible 

11. Order the rows by Subject and then Activity Label

12. Write the tiday data to an output file called, Consolidated_TidyData.txt


###Implementation dependencies
This function requires data.table and dplyr libraries to run successfully.


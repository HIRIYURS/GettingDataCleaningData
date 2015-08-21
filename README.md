# GettingDataCleaningData
##Project work for Getting Data and Cleaning Data under Signature Track.

###Step by Step instructions to setup this project on your machine,
1. Download the data files (.zip file) from the url - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Extract the zip file in to the current directory. This will create a directory by name, "UCI HAR Dataset"
4. Download the run_analysis.R file from this project to your current working directory
5. Open your R console or R Studio and set the working directory (using setwd() function)to above working directory where you have placed the run_analysis.R and the "UCI HAR Dataset" folder(directory)
6. Source the run_analysis.R file to load/create the function run_analysis in your R working environment
7. Now you can run the function "run_analysis()" which will create new tidy data file, "clean_data.txt" under the current directory

The function run_analysis (defined in run_analysis.R file) does the following,
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Implementation dependencies
This function requires data.table and rshape2 libraries to run successfully.


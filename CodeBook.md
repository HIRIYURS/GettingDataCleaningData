#Project Code Book
##This code book describes the variables, the data, and all transformations or work that were performed to clean up the data used for this project

I am acknowledging the use of the data set used for this project with reference to the following publication,
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Cleaning up the data
==================================================================
The obejective of this exercise is to create a tidy data set combining the Training and the test data captured in to one data set, taking only the average(mean) of each variable for each activity and for each subject (who performed the test/training).

##Training Data summary:
1. Number of Subjects = 21
2. Number of Features = 561 (For each activity (6))
3. Number of Features sample available for the 21 subjects performing various Activities = 7352

##Test Data summary:
1. Number of Subjects = 9
2. Number of Features = 561 (For each activity (6))
3. Number of Features sample available for the 9 subjects performing various Activities = 2947

##Total Summary (test and Training data combined)
1. Number of Subjects = 30
2. Number of Features = 561 (For each activity (6))
3. Number of Features sample available for the 30 subjects performing various Activities = 10299

#Summary of Tidy Data,
##1. 180 Rows x 88 Columns = Tidy data (output)
###2. 86 = Total number of features/variables with only the measurements on the mean and standard deviation for each 

measurement
###3. 88 = Total number of columns in the Tiday data (Subject, Activity and average of the mean or std measurements)
###4. 180 (30 Subjects * 6 Activities) = Total number of rows in the Tidy data 

## Variables (Columns = 88) in the Tidy data (output)
 [1] "Subject"                                          
 [2] "Activity"                                         
 [3] "TimeBodyAccelerometerMean()-X"                    
 [4] "TimeBodyAccelerometerMean()-Y"                    
 [5] "TimeBodyAccelerometerMean()-Z"                    
 [6] "TimeBodyAccelerometerSTD()-X"                     
 [7] "TimeBodyAccelerometerSTD()-Y"                     
 [8] "TimeBodyAccelerometerSTD()-Z"                     
 [9] "TimeGravityAccelerometerMean()-X"                 
[10] "TimeGravityAccelerometerMean()-Y"                 
[11] "TimeGravityAccelerometerMean()-Z"                 
[12] "TimeGravityAccelerometerSTD()-X"                  
[13] "TimeGravityAccelerometerSTD()-Y"                  
[14] "TimeGravityAccelerometerSTD()-Z"                  
[15] "TimeBodyAccelerometerJerkMean()-X"                
[16] "TimeBodyAccelerometerJerkMean()-Y"                
[17] "TimeBodyAccelerometerJerkMean()-Z"                
[18] "TimeBodyAccelerometerJerkSTD()-X"                 
[19] "TimeBodyAccelerometerJerkSTD()-Y"                 
[20] "TimeBodyAccelerometerJerkSTD()-Z"                 
[21] "TimeBodyGyroscopeMean()-X"                        
[22] "TimeBodyGyroscopeMean()-Y"                        
[23] "TimeBodyGyroscopeMean()-Z"                        
[24] "TimeBodyGyroscopeSTD()-X"                         
[25] "TimeBodyGyroscopeSTD()-Y"                         
[26] "TimeBodyGyroscopeSTD()-Z"                         
[27] "TimeBodyGyroscopeJerkMean()-X"                    
[28] "TimeBodyGyroscopeJerkMean()-Y"                    
[29] "TimeBodyGyroscopeJerkMean()-Z"                    
[30] "TimeBodyGyroscopeJerkSTD()-X"                     
[31] "TimeBodyGyroscopeJerkSTD()-Y"                     
[32] "TimeBodyGyroscopeJerkSTD()-Z"                     
[33] "TimeBodyAccelerometerMagnitudeMean()"             
[34] "TimeBodyAccelerometerMagnitudeSTD()"              
[35] "TimeGravityAccelerometerMagnitudeMean()"          
[36] "TimeGravityAccelerometerMagnitudeSTD()"           
[37] "TimeBodyAccelerometerJerkMagnitudeMean()"         
[38] "TimeBodyAccelerometerJerkMagnitudeSTD()"          
[39] "TimeBodyGyroscopeMagnitudeMean()"                 
[40] "TimeBodyGyroscopeMagnitudeSTD()"                  
[41] "TimeBodyGyroscopeJerkMagnitudeMean()"             
[42] "TimeBodyGyroscopeJerkMagnitudeSTD()"              
[43] "FrequencyBodyAccelerometerMean()-X"               
[44] "FrequencyBodyAccelerometerMean()-Y"               
[45] "FrequencyBodyAccelerometerMean()-Z"               
[46] "FrequencyBodyAccelerometerSTD()-X"                
[47] "FrequencyBodyAccelerometerSTD()-Y"                
[48] "FrequencyBodyAccelerometerSTD()-Z"                
[49] "FrequencyBodyAccelerometerMeanFreq()-X"           
[50] "FrequencyBodyAccelerometerMeanFreq()-Y"           
[51] "FrequencyBodyAccelerometerMeanFreq()-Z"           
[52] "FrequencyBodyAccelerometerJerkMean()-X"           
[53] "FrequencyBodyAccelerometerJerkMean()-Y"           
[54] "FrequencyBodyAccelerometerJerkMean()-Z"           
[55] "FrequencyBodyAccelerometerJerkSTD()-X"            
[56] "FrequencyBodyAccelerometerJerkSTD()-Y"            
[57] "FrequencyBodyAccelerometerJerkSTD()-Z"            
[58] "FrequencyBodyAccelerometerJerkMeanFreq()-X"       
[59] "FrequencyBodyAccelerometerJerkMeanFreq()-Y"       
[60] "FrequencyBodyAccelerometerJerkMeanFreq()-Z"       
[61] "FrequencyBodyGyroscopeMean()-X"                   
[62] "FrequencyBodyGyroscopeMean()-Y"                   
[63] "FrequencyBodyGyroscopeMean()-Z"                   
[64] "FrequencyBodyGyroscopeSTD()-X"                    
[65] "FrequencyBodyGyroscopeSTD()-Y"                    
[66] "FrequencyBodyGyroscopeSTD()-Z"                    
[67] "FrequencyBodyGyroscopeMeanFreq()-X"               
[68] "FrequencyBodyGyroscopeMeanFreq()-Y"               
[69] "FrequencyBodyGyroscopeMeanFreq()-Z"               
[70] "FrequencyBodyAccelerometerMagnitudeMean()"        
[71] "FrequencyBodyAccelerometerMagnitudeSTD()"         
[72] "FrequencyBodyAccelerometerMagnitudeMeanFreq()"    
[73] "FrequencyBodyAccelerometerJerkMagnitudeMean()"    
[74] "FrequencyBodyAccelerometerJerkMagnitudeSTD()"     
[75] "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()"
[76] "FrequencyBodyGyroscopeMagnitudeMean()"            
[77] "FrequencyBodyGyroscopeMagnitudeSTD()"             
[78] "FrequencyBodyGyroscopeMagnitudeMeanFreq()"        
[79] "FrequencyBodyGyroscopeJerkMagnitudeMean()"        
[80] "FrequencyBodyGyroscopeJerkMagnitudeSTD()"         
[81] "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()"    
[82] "Angle(TimeBodyAccelerometerMean,Gravity)"         
[83] "Angle(TimeBodyAccelerometerJerkMean),GravityMean)"
[84] "Angle(TimeBodyGyroscopeMean,GravityMean)"         
[85] "Angle(TimeBodyGyroscopeJerkMean,GravityMean)"     
[86] "Angle(X,GravityMean)"                             
[87] "Angle(Y,GravityMean)"                             
[88] "Angle(Z,GravityMean)"

##Key transformations of the data in the analysis script (along with code snippet),
1. Set the Column names of the merged data set (Test and Training)
	- Variable "combinedFeatures" in the script - Transpose the 2nd column in
	  Features.txt file into Column names (Variable) of the features data set.  
	- Variable "combinedLabels" in the script - "Activity" for Labels data set
	- Variable "combinedsubject" in the script - "Subject" for Subject data set
	- Code in the script: 
		colnames(combinedLabels) <- "Activity"
		colnames(combinedsubject) <- "Subject"
		colnames(combinedFeatures) <- t(featureNames[2])

2. Merging the Test and the Training data sets
	- combinedData variable in the script
	- Code in the script:
		combinedData <- cbind(combinedsubject, combinedLabels, combinedFeatures)

3. Select only the columns with Mean and std values
	- Code in the script:
		meanSTDColumns <- grep(".*Mean.*|.*Std.*", names(combinedData), ignore.case=TRUE)

4. Extracts only the measurements on the mean and standard deviation for each measurement.
	- Code in the script:
		meanSTDData <- combinedData[,finalColumns]

5. Uses descriptive activity names to name the activities in the data set
	- Replace the Activity Label ID (1-6) with actual Activity Lables from activity_labels.txt file
	- Code in the script:
		meanSTDData$Activity <- as.character(meanSTDData$Activity)
		for (i in 1:6){
		   meanSTDData$Activity[meanSTDData$Activity == i] <- as.character(activityLabels[i,2])
		}

6. Appropriately labels the data set with descriptive variable names.

7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 

activity and each subject.
	- Use aggregate function to compute the averages of each varaible 
	- Code in the script:
		meanTidyData <- aggregate(. ~Subject + Activity, meanSTDData, mean)

8. Order the rows by Subject and then Activity Label
	- Code in the script:
		meanTidyData <- meanTidyData[order(meanTidyData$Subject,meanTidyData$Activity),]

9. Write the tiday data to an output file
	- Code in the script:
		write.table(meanTidyData, file = "./Consolidated_TidyData.txt", row.names = FALSE)


Data and Variables
==================================================================
The details of the data and the variables has been provided below (from the README.txt of the original data set published by authors)

##Human Activity Recognition Using Smartphones Dataset - Version 1.0
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

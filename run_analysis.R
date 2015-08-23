##          Getting Data and Cleaning Data - Project Work
## ====================================================================
## One of the most exciting areas in all of data science right now is wearable
## computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop
## the most advanced algorithms to attract new users. The data linked to from 
## the course website represent data collected from the accelerometers from the 
## Samsung Galaxy S smartphone. A full description is available at the site where
## the data was obtained: 
##
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
##
## This R script (run_analysis.R - Can be made into function as well) does the following,
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
##

##run_analysis <- function() {
    
    require(data.table)
    require(dplyr)
    
    ## Read the Features and Activity Labels
    featureNames <- read.table("./UCI HAR Dataset/features.txt")
    activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

    ## Read the Training data - Subject, Lables, Training features data
    trainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    trainingLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
    trainingFeatures <- read.table("./UCI HAR Dataset/train/X_train.txt")

    ## Read the Test data -  - Subject, Lables, Training features data
    testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
    testFeatures <- read.table("./UCI HAR Dataset/test/X_test.txt")

    ## Merge Test and Training data - Subject, lables and Features data
    ## respectively
    combinedsubject <- rbind(trainingSubject, testSubject)
    combinedLabels <- rbind(trainingLabels, testLabels)
    combinedFeatures <- rbind(trainingFeatures, testFeatures)

    ## Set the Column names
    colnames(combinedLabels) <- "Activity"
    colnames(combinedsubject) <- "Subject"
    
    ## Transpose the 2nd column in Features.txt file into Column names (Variable) of 
    ## the features data set 
    colnames(combinedFeatures) <- t(featureNames[2])
    
    ## Step 1: Merges the training and the test sets to create one data set.
    ## Merge Subject, Activity Labels and Features
    combinedData <- cbind(combinedsubject, combinedLabels, combinedFeatures)

    ## Select only the columns with Mean and std values
    meanSTDColumns <- grep(".*Mean.*|.*Std.*", names(combinedData), ignore.case=TRUE)
    
    ## We also need Subject(1) and Activity Label(2) columns (Variables)
    finalColumns <- c(1, 2, meanSTDColumns)
    
    dim(combinedData)
    
    ## Step 2: Extracts only the measurements on the mean and standard
    ##         deviation for each measurement.
    meanSTDData <- combinedData[,finalColumns]
    dim(meanSTDData)
    
    ## Step 3: Uses descriptive activity names to name the activities in the data set
    ## Replace the Activity Label ID (1-6) with actual 
    ## Activity Lables from activity_labels.txt file
    meanSTDData$Activity <- as.character(meanSTDData$Activity)
    for (i in 1:6){
        meanSTDData$Activity[meanSTDData$Activity == i] <- as.character(activityLabels[i,2])
    }
    
    ## Convert back the Activity Label column from text/character to factor
    meanSTDData$Activity <- as.factor(meanSTDData$Activity)
    
    names(meanSTDData)
    
    ## Step 4: Appropriately labels the data set with descriptive variable names. 
    names(meanSTDData)<-gsub("Acc", "Accelerometer", names(meanSTDData))
    names(meanSTDData)<-gsub("Gyro", "Gyroscope", names(meanSTDData))
    names(meanSTDData)<-gsub("BodyBody", "Body", names(meanSTDData))
    names(meanSTDData)<-gsub("Mag", "Magnitude", names(meanSTDData))
    names(meanSTDData)<-gsub("^t", "Time", names(meanSTDData))
    names(meanSTDData)<-gsub("^f", "Frequency", names(meanSTDData))
    names(meanSTDData)<-gsub("tBody", "TimeBody", names(meanSTDData))
    names(meanSTDData)<-gsub("-mean()", "Mean", names(meanSTDData), ignore.case = TRUE)
    names(meanSTDData)<-gsub("-std()", "STD", names(meanSTDData), ignore.case = TRUE)
    names(meanSTDData)<-gsub("-freq()", "Frequency", names(meanSTDData), ignore.case = TRUE)
    names(meanSTDData)<-gsub("angle", "Angle", names(meanSTDData))
    names(meanSTDData)<-gsub("gravity", "Gravity", names(meanSTDData))
    
    names(meanSTDData)

    ## Convert the subject column (1-30) into factor - will be useful for aggregating  
    meanSTDData$Subject <- as.factor(meanSTDData$Subject)
    
    ## Make it into a table for tidying the data and aggregating averages
    meanSTDData <- data.table(meanSTDData)
    
    ## Step 5: From the data set in step 4, creates a second, independent tidy data 
    ##         set with the average of each variable for each activity and each subject.

    ## Use aggregate function to compute the averages of each varaible 
    meanTidyData <- aggregate(. ~Subject + Activity, meanSTDData, mean)
    
    ## Order the rows by Subject and then Activity Label
    meanTidyData <- meanTidyData[order(meanTidyData$Subject,meanTidyData$Activity),]
    
    ## Write the tiday data to an output file
    write.table(meanTidyData, file = "./Consolidated_TidyData.txt", row.names = FALSE)
    
##}
    
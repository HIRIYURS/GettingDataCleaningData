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
## This R script (run_analysis.R) does the following,
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
##
run_analysis <- function() {
    require("data.table")
    require("reshape2")

    # Load: activity labels
    print("Read Activity Labels.")
    activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[,2]

    # Load: data column names
    print("Read Data column names.")
    features <- read.table("./data/UCI HAR Dataset/features.txt")[,2]

    # Extract only the measurements on the mean and standard deviation for each measurement.
    print("Step 2. Extract only the measurements on the mean and standard deviation for each measurement.")
    extract_features <- grepl("mean|std", features)

    # Load and process X_test & y_test data.
    print("Load the Test data, labels and subjects.")
    test_set <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    test_labels <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

    names(test_set) = features

    # Extract only the measurements on the mean and standard deviation for each 
    # measurement.
    test_set = test_set[,extract_features]

    # Step 3.Uses descriptive activity names to name the activities in the data set
    print("Step 3. Uses descriptive activity names for test data set")
    test_labels[,2] = activity_labels[test_labels[,1]]
    names(test_labels) = c("Activity_ID", "Activity_Label")
    names(test_subject) = "subject"

    # Bind data
    test_data <- cbind(as.data.table(test_subject), test_labels, test_set)

    # Load and process X_train & y_train data.
    print("Load the Training data.")
    train_set <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    train_labels <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

    train_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

    names(train_set) = features

    # Extract only the measurements on the mean and standard deviation for each measurement.
    train_set = train_set[,extract_features]

    # Step 3.Uses descriptive activity names to name the activities in the data set
    print("Step 3. Uses descriptive activity names for train data set")
    train_labels[,2] = activity_labels[train_labels[,1]]
    names(train_labels) = c("Activity_ID", "Activity_Label")
    names(train_subject) = "subject"

    # Bind data
    train_data <- cbind(as.data.table(train_subject), train_labels, train_set)

    # Merge test and train data
    print("Step 1. Merge test and train data")
    data = rbind(test_data, train_data)

    ## 4. Appropriately labels the data set with descriptive variable names
    print("Step 4. Appropriately labels the data set with descriptive variable names")
    id_labels   = c("subject", "Activity_ID", "Activity_Label")
    data_labels = setdiff(colnames(data), id_labels)
    melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

    # 5. Creates a second, independent tidy data set with the average of each 
    #    variable for each activity and each subject.
    # Apply mean function to dataset using dcast function
    print("Step 5. Create a new tidy data set with avg of each variable for each activity and each subject")
    tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

    print("Writing the Tidy data to tidy_data.txt file in data dir.")
    
    write.table(tidy_data, file = "./data/tidy_data.txt")
    
    print("Completed the analysis!!")
}
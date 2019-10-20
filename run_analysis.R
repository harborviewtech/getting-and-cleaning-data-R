## Pre-task: We need to load required packages

library(reshape2)


## STEP 1: Merges the training and the test data

# First, lets read data into separate data frames
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")
featureNames <- read.table("features.txt")


# add column names for the above files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2
names(y_train) <- "activity"
names(y_test) <- "activity"

# combine files into one dataset, first using the column bind and then row bind them again
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combinedFile <- rbind(train, test)


## STEP 2: Extract measurements based on the mean and standard deviation for each measurement.

# First, lets determine which columns contain "mean()" or "std()" using grep function and regular expressions
meanAndStd <- grepl("mean\\(\\)", names(combinedFile)) |
  grepl("std\\(\\)", names(combinedFile))

# ensure that we also keep the subjectID and activity columns
meanAndStd[1:2] <- TRUE

# extract the necessary columns, hence, thereby removing unnecessary columns
combinedFile <- combinedFile[, meanAndStd]


## STEP 3: Lets label the data set with descriptive activity names. 

# turn activities & subjects into factors
combinedFile$activity <- factor(combinedFile$activity, labels=c("Walking",
                                                        "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


## STEP 4: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create melted data
melted <- melt(combinedFile, id=c("subjectID","activity"))
# create tidy object
tidy <- dcast(melted, subjectID + activity ~ variable, mean)

# save the tidy data set to a file
write.table(tidy, "tidy.txt", row.names = FALSE)

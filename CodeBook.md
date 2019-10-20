## Code Book

This code book describes the data used in this project and the steps used to create a tidy data set from the raw given data.

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The recorded dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The objective of this project is to create a single tidy data set.

### List of files used in the processing
These are the files used (and bried descrition)

features.txt   -- Names of the features

activity_labels.txt  -- Name and ID of the activities

X_train.txt  --  Observations of the features

subject_train.txt -- A vector of integers representing the ID of the volunteer for observations in X_train.txt

y_train.txt  -- A vector of integers representing the ID of the activity for observations in train.txt

X_test.txt -- observations of the features for 9 of the 30 volunteers.

subject_test.txt --  A vector of integers representing the ID of the volunteer for observations in X_test.txt

y_test.txt -- A vector of integers representing the ID of the activity for observations in X_test.txt



### Data not used

The raw signal data is not used.

## Activity Labels
These are the activities (lables), each representing the kind of activity that the subject of the study was performing during the test.

WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


### Processing steps

1. Relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
2. Only columns that contain the exact string "mean()" or "std()" were selected. 
3. Since the activity columns that were in integer got converted to a factor, using labels (listed above) describing the activities.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. 
5. The tidy data is saved as txt file.
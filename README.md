# Getting and Cleaning Data Peer Assignment
Peer Assignment for Coursera 

Steps taken in the R Script:
- Import the test data
- Import the training data
- Merge the training and the test sets to create one data set.
- Combine the X data, Y data, and subject row identification into full versions of each
- Now the data frames are joined: naming the columns in x_full from features.txt
- The columns with the desired measurements are labeled using mean() and std() so grepl on the column names looking for partial matches will flag them. '|' will create a vector that is true if either is matched.
- Using descriptive activity names to name the activities in the data set
- Appropriately labeling the data set with descriptive activity names.
- Translating Y_full into a factor column
- Setting the name of the new first column to "activity"
- Creating a second, independent tidy data set with the average of each variable for each activity and each 
  subject. 

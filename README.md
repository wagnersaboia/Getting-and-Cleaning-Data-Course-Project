Getting-and-Cleaning-Data-Course-Project
========================================


##This document describes how the R script "run_analysis.R" works.


First I read into R the data sets (training data and test data).

Then I merged the two data sets using the R function cbind.

I rest of the code can be described as follows:

* Extracts the mean and standard deviation for each measurement.
* Set a descriptive activity names to name the activities in the merged data set
* Labels the data set with descriptive activity names.
* Creates a tidy data set with the average of each variable for each activity and each subject

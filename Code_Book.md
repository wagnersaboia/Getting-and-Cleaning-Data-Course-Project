Description the variables contained in the tidy data result
===========

The data set submited for this course project (which can be seen in the file "tidy_data_set.txt") has the following variables:

* activity_id                
* subject_id
* tBodyAcc.mean.-XYZ
* tGravityAcc.mean.-XYZ
* tBodyAccJerk.mean.-XYZ
* tBodyGyro.mean.-XYZ
* tBodyGyroJerk.mean.-XYZ
* tBodyAccMag.mean
* tGravityAccMag.mean
* tBodyAccJerkMag.mean
* tBodyGyroMag.mean
* tBodyGyroJerkMag.mean
* fBodyAcc.mean.-XYZ
* fBodyAccJerk.mean.-XYZ
* fBodyGyro.mean.-XYZ
* fBodyAccMag.mean
* fBodyBodyAccJerkMag.mean
* fBodyBodyGyroMag.mean
* fBodyBodyGyroJerkMag.mean
* activity_label

The variables "activity_id" and "activity_label" are related to the activites as follows:

In the first column (before the ".") "activity_id" and in the second column "activity_label".

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The variable "subject_id" is an identifier of each subject in the sample.

The other variables are signals that were used to estimate variables of the feature vector for each pattern:  
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* "mean" can be either "mean" when the mean value of the variable is estimated, or "std" when the standard seviation of the variable is estimated.

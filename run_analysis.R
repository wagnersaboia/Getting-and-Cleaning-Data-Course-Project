# testing data
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject_id"))
sub_test$ID <- as.numeric(rownames(sub_test))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_test$ID <- as.numeric(rownames(X_test))
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity_id"))
y_test$ID <- as.numeric(rownames(y_test))
test <- merge(sub_test, y_test, all=T) 
test <- merge(test, X_test, all=T) 

# trainning data
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject_id"))
sub_train$ID <- as.numeric(rownames(sub_train))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_train$ID <- as.numeric(rownames(X_train))
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity_id"))
y_train$ID <- as.numeric(rownames(y_train))
train <- merge(sub_train, y_train, all=T)
train <- merge(train, X_train, all=T)

# Bind trainning data and testing data
bindding <- rbind(train, test)

feat <- read.table("UCI HAR Dataset/features.txt", col.names=c("feature_id", "feature_label"),)
sel_feat <- feat[grepl("mean\\(\\)", feat$feature_label) | grepl("std\\(\\)", feat$feature_label), ]
extract <- bindding[, c(c(1, 2, 3), sel_feat$feature_id + 3) ]

ac_lab <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activity_id", "activity_label"),)
labeld_data <- merge(extract, ac_lab)

sel_feat$feature_label <- gsub("\\(\\)", "", sel_feat$feature_label)
sel_feat$feature_label <- gsub("-", ".", sel_feat$feature_label)
n <- length(sel_feat$feature_label)
for (i in 1:n) {colnames(labeld_data)[i + 3] <- sel_feat$feature_label[i]}
labeld_data2 <- labeld_data

fields <- c("ID","activity_label")
labeld_data3 <- labeld_data2[,!(names(labeld_data2) %in% fields)]
tidy_data <-aggregate(labeld_data3, 
                      by=list(subject = labeld_data3$subject_id, activity = labeld_data3$activity_id), FUN=mean, na.rm=T)
fields <- c("subject","activity")
tidy_data <- tidy_data[,!(names(tidy_data) %in% fields)]
tidy_data <- merge(tidy_data, ac_lab)
write.csv(file="tidy_data_set.csv", x=tidy_data)

write.table(tidy_data,"tidy_data_set.txt",sep = ",")

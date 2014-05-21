#OPEN DATA

X.train<-read.table("UCIHARDataset/train/X_train.txt", colClasses="numeric") # training set
X.test<-read.table("UCIHARDataset/test/X_test.txt", colClasses="numeric") # testing set

y.train<-read.table("UCIHARDataset/train/y_train.txt") # Training labels
y.test<-read.table("UCIHARDataset/test/y_test.txt") #  Testing label

subject.train<-read.table("UCIHARDataset/train/subject_train.txt", col.names='subject') #- Each row identifies the subject who performed the activity for each window sample
subject.test<-read.table("UCIHARDataset/test/subject_test.txt" , col.names='subject') #- Each row identifies the subject who performed the activity for each window sample

activity.labels<-read.table("UCIHARDataset/activity_labels.txt", col.names=c('numbers','names')) #-  Links the class labels with their activity name.

features<-read.table("UCIHARDataset/features.txt") #- 'features.txt': List of all measuread variables



# MERGING DATASETS, ASSIGNING COLUMN NAMES, ASSIGNING ACTIVITY NAMES
X.merge <- rbind(X.test, X.train) # append train set to test set
y.merge <- rbind(y.test, y.train)  # append training labels to test labels
subject.merge <- rbind(subject.test, subject.train) # append train subjects to test subjects

featureNames <- as.character(features$V2)
colnames(X.merge) <- featureNames # assigns column names to set
colnames(y.merge) <- 'Activity'  # assigns column names to activity

#substitute number of activities (1,2,..., 6) with names (WALKING, .... , LAYING)
y.merge$Activity<-factor(y.merge$Activity) #makes factor
levels(y.merge$Activity) <- activity.labels$names  # substitutes numbers with names

# final join of subjects, activties, data set 
bigtable = cbind(subject.merge, y.merge,X.merge)


# EXTRACT COLUMNS OF INTEREST (MEANS or STANDARD DEVIATIONS)

# select columns containing words 'Std' or 'Mean' or 'Activity' or 'subject'
selection <- grepl('std\\(\\)',colnames(bigtable))  | grepl('mean\\(\\)',colnames(bigtable)) | grepl('Activity',colnames(bigtable))  | grepl('subject',colnames(bigtable))

# create table with only those columns
newtable<-bigtable[,selection]


# COMPUTE AVERAGE VALUES
# for each combination of subject and activity, compute mean of every variable
averages <-aggregate(newtable[,c(3:ncol(newtable))], by=list(newtable$subject,newtable$Activity), FUN=mean, na.rm=FALSE)
colnames(averages)[1] <- 'subject'
colnames(averages)[2] <- 'Activity'

#sort by subject and activity
averages <-averages[order(averages$subject, averages$Activity), ]



# EXPORT TABLE IN A TAB-DELIMITED FILE
# give better names to columns
colnames(averages)<-gsub("tBody", "TimeBody", colnames(averages))
colnames(averages)<-gsub("fBody", "FrequencyBody", colnames(averages))
colnames(averages)<-gsub("tGravity", "TimeGravity", colnames(averages))
colnames(averages)<-gsub("fGravity", "FrequencyGravity", colnames(averages))
colnames(averages)<-gsub("\\)", "", colnames(averages))
colnames(averages)<-gsub("\\(", "", colnames(averages))
colnames(averages)<-gsub("-", "", colnames(averages))
colnames(averages)<-gsub(",", "", colnames(averages))
colnames(averages)<-gsub("Acc", "Acceleration", colnames(averages))
colnames(averages)<-gsub("Gyro", "Gyroscope", colnames(averages))
colnames(averages)<-gsub("gravity", "Gravity", colnames(averages))
colnames(averages)<-gsub("mean", "Mean", colnames(averages))
colnames(averages)<-gsub("std", "Std", colnames(averages))

# just to make columns more aligned
levels(averages$Activity)[1] <- "WALKING               "
levels(averages$Activity)[4] <- "SITTING               "
levels(averages$Activity)[5] <- "STANDING               "
levels(averages$Activity)[6] <- "LAYING               "

# write data into a tab-delimited file
write.table( format(averages,scientific=TRUE), "tidy.data.txt", sep='\t', row.names = FALSE, quote=FALSE)


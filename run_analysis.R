## Setting the script folder to be current directory 
CurrentScriptDirectory = script.dir <- dirname(sys.frame(1)$ofile)
setwd(CurrentScriptDirectory)

library(dplyr)

#Readin the data
train_x <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))
train_y <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))
test_x <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))
test_y <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))
train_subject <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))
test_subject <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))
featuerNames<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
ActivityLabels<-tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE))

#Giving the y's proper names
colnames(train_y) <- c("Activity Name")
colnames(test_y) <- c("Activity Name")

#Giving the subjects data proper column names
colnames(train_subject) <- c("SubjectNumber")
colnames(test_subject) <- c("SubjectNumber")

#Reading features names

featuerNames<-featuerNames[,2]
featuerNames<-make.names(featuerNames,unique=TRUE, allow_ = TRUE)

#Giving the training and test data proper names
colnames(train_x) <- featuerNames
colnames(test_x) <- featuerNames

#Adding the subject number and lables columns
labeledTrainingSet <- bind_cols(train_x,train_y,train_subject)
labeledTestSet <- bind_cols(test_x,test_y,test_subject)

#Joining the test data and training data together
labledDataSet <- bind_rows(labeledTrainingSet,labeledTestSet)

relaventFeaturesFromData <- labledDataSet %>% select(matches("mean|std|Activity|Subject"))

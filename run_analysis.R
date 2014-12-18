# Setup
setwd("~/R")
library(plyr)

# Read Data
train <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE )
train[,562] <- read.table("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE )
train[,563] <- read.table("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE )
test <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE )
test[,562] <- read.table("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE )
test[,563] <- read.table("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE )
labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE )
headings <- read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE )

# Merge test and training data tables
merged = rbind(train, test)

# tidy headings
headings[,2] = gsub('-mean', 'Mean', headings[,2])
headings[,2] = gsub('-std', 'Std', headings[,2])
headings[,2] = gsub('[-()]', '', headings[,2])
headings[,2] = gsub('[,()]', '', headings[,2])

# Select columns for mean and sd
columns_needed <- grep(".*Mean.*|.*Std.*", headings[,2])

# Remove columns that are not wanted
headings <- headings[columns_needed,]

# Add subject and activity columns
columns_needed <- c(columns_needed, 562, 563)

# remove unwanted columns in data field
merged <- merged[,columns_needed]

# add column names
colnames(merged) <- c(headings$V2, "activity", "subject")
colnames(merged) <- tolower(colnames(merged))

# add activity labels
merged[,87] <- labels[merged[,87],2]

# Create and save resulting data set 
final_data <- ddply(merged, .(subject, activity), function(x) colMeans(x[,1:86]))
write.table(final_data, "tidydata.txt", sep="\t", row.name=FALSE)


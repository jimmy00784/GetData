#Getting and Cleaning Data - Class Project
#Author: Karim Lalani

#Read feature names, remove '(', ')', and lowercase
#Also exclude features that are not mean or standard deviation

features <- read.table("features.txt",stringsAsFactors = FALSE)
features <- features[grep("(mean|std)",features$V2),]
features$V2 <- gsub("\\(\\)","", tolower(features$V2))

#Read training data for subject, X, and y
#From X, exclude features that are not mean or standard deviation

subjecttrain <- read.table("train/subject_train.txt")
xtrain <- read.table("train/X_train.txt")
xtrain <- xtrain[,features$V1]

ytrain <- read.table("train/y_train.txt")

#Read test data for subject, X, and y
#From X, exclude features that are not mean or standard deviation

subjecttest <- read.table("test/subject_test.txt")
xtest <- read.table("test/X_test.txt")
xtest <- xtest[,features$V1]

ytest <- read.table("test/y_test.txt")

#Merge training and test data

sub <- rbind(subjecttrain,subjecttest)
names(sub) <- "subject"

X <- rbind(xtrain,xtest)
y <- rbind(ytrain,ytest)


#Rename features for merged dataset

names(X) <- features$V2

#Convert y values to descriptive activity names
labels <- read.table("activity_labels.txt",stringsAsFactors = FALSE)
labels[,2] <- gsub("_"," ",labels[,2])

y[,1] <- labels[y[,1],2]
names(y) <- "activity"

#Create new dataset with means for all features by subject and activity

step5 <- aggregate(X,by=list(sub[,1],y[,1]),FUN=mean)
names(step5)[1:2] <- c("subject","activity")

#Write new dataset to file
write.table(step5,row.names=FALSE,file="step5.txt")

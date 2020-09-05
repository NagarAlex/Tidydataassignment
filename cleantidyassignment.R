#Viewing files in folder
list.files("UCI HAR Dataset")
#Step 1
#Viewing files in test folder
list.files("UCI HAR Dataset\\test")
#getting test data
xtest <- read.delim("UCI HAR Dataset\\test\\X_test.txt",
                    sep = "", header = FALSE)
#step 4
#adding variables names to test data
xnames <- read.delim("UCI HAR Dataset\\features.txt",
                     header = FALSE)
#transpose
xnames <- t(xnames)
#add to x
colnames(xtest) <- xnames
#y and subject test
ytest <- read.delim("UCI HAR Dataset\\test\\y_test.txt",
                    sep = "", header = FALSE)
colnames(ytest) <- "activity"
sttest <-read.delim("UCI HAR Dataset\\test\\subject_test.txt",
                    sep = "", header = FALSE)
colnames(sttest) <- "subject"
#merge
test <- cbind(sttest,ytest,xtest)
#Viewing files in folder
list.files("UCI HAR Dataset")
#Viewing files in train folder
list.files("UCI HAR Dataset\\train")
#getting train data
xtrain <- read.delim("UCI HAR Dataset\\train\\X_train.txt",
                     sep = "", header = FALSE)
#step 4
#adding variables names to test data
xnames <- read.delim("UCI HAR Dataset\\features.txt",
                     header = FALSE)
#transpose
xnames <- t(xnames)
#add to x
colnames(xtrain) <- xnames
#y and subject test
ytrain <- read.delim("UCI HAR Dataset\\train\\y_train.txt",
                     sep = "", header = FALSE)
colnames(ytrain) <- "activity"
sttrain <-read.delim("UCI HAR Dataset\\train\\subject_train.txt",
                     sep = "", header = FALSE)
colnames(sttrain) <- "subject"
#merge
train <- cbind(sttrain,ytrain,xtrain)
#merging test and train
merged <- rbind(test,train)
#step 2
#selecting means
meancols <- merged[,grep("mean", names(merge))]
#selecting sd
sdcols <- merged[, grep("std", names(merge))]
#selecting subject and activity columns
subact <- merged[,1:2]
#merge back
mnsd <- cbind(subact,meancols, sdcols)
#step 3
#replace activity index numbers by activity names
ActInd <- read.csv("UCI HAR Dataset\\activity_labels.txt",
                   header= FALSE, sep = "")
for(i in 1:6){mnsd[,2] <- gsub(i, ActInd[i,2], mnsd[,2])}
#step 4 was done earlier during step 1 (variable names were added)

#step 5
averages <- aggregate(mnsd, by= list("Subject"= mnsd$subject,
                                     "Activity" =mnsd$activity), FUN = mean, na.rm = TRUE)
#tidy
averages[,3:4] <- NULL
#write tables
write.table(mnsd, "cleaneddata.txt", row.name = FALSE)
write.table(averages, "averages.txt", row.name = FALSE)
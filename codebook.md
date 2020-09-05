This file is a codebook describing the objects created in the run_analysis.r script

Step 1

xtest: Data on the recorded variables in the test folder 

ytest: Activity data in the test folder

sttest: Subject data in the test folder

xnames: Names of the xtest variables

test: merged data frame of all of the test variables

xtrain, ytrain etc are the train equivalents of the test objects

merged: the merged dataset containing both the test and train data


Step 2


meancols: data referring only to means

sdcols: data referring only to standard deviations

subact: data referring to subject and activity only

mnsd: The result of merging the above three objects: m(ea)ns(tandard)d(eviation)

Step 3 

ActInd: The key assigning the activity numbers to the names of each activity

Step 5

averages: data frame showing the averages of each variable for every possible subject/activity pair

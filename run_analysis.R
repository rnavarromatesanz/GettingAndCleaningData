
#Initially the Working directory is set in order to reduce the path length
#Update the current Wd wit your Work directory in order to execute the Scripts
setwd("D:\\UNIVERSIDAD\\0.COURSERA\\02. Getting and Cleaning Data\\project")

#The structure of the current script will be the same that the structure pointed out 
#in the project documentation

#1.  Merges the training and the test sets to create one data set.
#In this part we are going to load the files and merge them


    #If you need to install data.table package, uncomment the follwoing line
    #install.packages("data.table")
    
    library(data.table)
    
    #We are goint to read the training data
    subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",head=FALSE)
    x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",head=FALSE)
    y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",head=FALSE)
    
    #We are goint to read the test data
    subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",head=FALSE)
    x_test<-read.table("./UCI HAR Dataset/test/X_test.txt",head=FALSE)
    y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",head=FALSE)
    
    #We unify the data by columns in both cases
    train<-cbind(subject_train,y_train,x_train)
    test<-cbind(subject_test,y_test,x_test)
    
    #We unify the data by rowns.
    mergedValues<-rbind(train,test)

#2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
    #In this case we generate a new couple of Arrays with the mean and the Standard Desviation 
    meanValues<-apply(mergedValues,2, mean)
    StandardDesviation<-apply(mergedValues,2, sd)

# In this case we are going to swap the steps 3 and 4 in order to simplify the process
#4.  Appropriately labels the data set with descriptive variable names. 
    names<-c(c("subject","Activity"),c(seq(to=561)))
    colnames(mergedValues)<-names

#3.  Uses descriptive activity names to name the activities in the data set
    activity_labels<-subject_train<-read.table("./UCI HAR Dataset/activity_labels.txt",head=FALSE)
    mergedValues["Activity"]<-activity_labels[mergedValues$Activity,2]

#5.  From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.

    #We gent the diferent values for subject and activities
    users<-unique(mergedValues$subject)
    activities<-unique(mergedValues$Activity)
    
    #we get the number of each one.
    numUser<-length(users)
    numActivities<-length(activities)
    
    #A new DataFrame is created in order to introduce the new values
    meanValues<-array(data=NA,dim=c(numUser*numActivities,ncol(mergedValues)))
    colnames(meanValues)<-names
    
    
    #The data frames is fullfilled with the means for each combiantion of Subject and aactivitie
    i<-1
    for (NUser in users){
      for (NAct in activities) {
        meanValues[i,1]<-NUser
        meanValues[i,2]<-NAct
        meanValues[i,c(3:563)]<-apply(mergedValues[c(mergedValues$subject==NUser & mergedValues$Activity==NAct),c(3:563)],2,mean)
        i<-i+1
      }
    }
    
    #Finally the tyda Data set is written into file.
    write.table(meanValues,"tidyDataSet.txt",row.name=FALSE)

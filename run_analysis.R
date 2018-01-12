run_analysis <- function() {
  
  #insert your unique path
  X_test<-read.table("E:/R Working Directory/UCI HAR Dataset/test/X_test.txt")
  Y_test<-read.table("E:/R Working Directory/UCI HAR Dataset/test/y_test.txt")
  subject_test<-read.table("E:/R Working Directory/UCI HAR Dataset/test/subject_test.txt")
  
  
  #insert your unique path
  X_train<-read.table("E:/R Working Directory/UCI HAR Dataset/train/X_train.txt")
  Y_train<-read.table("E:/R Working Directory/UCI HAR Dataset/train/y_train.txt")
  subject_train<-read.table("E:/R Working Directory/UCI HAR Dataset/train/subject_train.txt")
  
  
  X_full<-rbind(X_test, X_train)
  Y_full<-rbind(Y_test, Y_train)
  subject_full<-rbind(subject_test, subject_train)
  
  #insert your unique path
  features <- read.table("E:/R Working Directory/UCI HAR Dataset/features.txt")
  colnames(X_full)<-features[,2]
  

  rightcols<- grepl("mean()",colnames(X_full)) | grepl("std()",colnames(X_full))

  X_mean_std <- X_full[,rightcols]
  

  activities<-read.table("E:/R Working Directory/UCI HAR Dataset/activity_labels.txt")
  
  Y_factor <- as.factor(Y_full[,1])
  
  library(plyr)
  
  Y_factor <- mapvalues(Y_factor,from = as.character(activities[,1]), to = as.character(activities[,2]))
  
  X_mean_std <- cbind(Y_factor, X_mean_std)  
  
  colnames(X_mean_std)[1] <- "activity"
  
  X_mean_std <- cbind(subject_full, X_mean_std)
  colnames(X_mean_std)[1] <- "subject"
  
  
  library(reshape2)
  
  X_melt<- melt(X_mean_std,id.vars=c("subject","activity"))
  Xav_tidy <- dcast(X_melt, subject + activity ~ ..., mean)
  
  
  return(Xav_tidy)
  
}

### PART I ###
### Merges the training and the test sets to create one data set. ###

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data.zip", method = "libcurl")
unzip('data.zip')
original_path = getwd()

# Set working directory to 'UCI HAR DATASET Folder
UCI = "UCI HAR Dataset"
new_path = file.path(original_path, UCI, fsep = "/")
setwd(new_path)

# Read in train data
ytrain = read.table('./train/y_train.txt')
Xtrain = read.table('./train/X_train.txt')
subjectrain = read.table('./train/subject_train.txt')

# Read in test
ytest = read.table('./test/y_test.txt')
Xtest = read.table('./test/X_test.txt')
subjectest = read.table('./test/subject_test.txt')

# Bind them together
ytotal = rbind(ytrain, ytest)
colnames(ytotal) = "activity"

Xtotal = rbind(Xtrain, Xtest)
features = read.table('features.txt')
names = features[,2]
colnames(Xtotal) = names

subjectTotal = rbind(subjectrain, subjectest)
colnames(subjectTotal) = "subject"

subtotal = cbind(ytotal, subjectTotal)

total = cbind(subtotal, Xtotal)

### PART II ###
column_names = colnames(total)
columns = c(1:2)

mean.stdev = grep(".*(mean|std)\\(\\)",column_names)
columns = append(columns,mean.stdev)

total = total[,columns]

### PART III ###

activity_dec <- function(x) {
  if (x == 1) {
    return('WALKING')
  } else if ( x == 2) {
    return('WAKING_UPSTAIRS')
  } else if ( x == 3) { 
    return('WALKING_DOWNSTAIRS')
  } else if ( x == 4) {
    return('SITTING')
  } else if ( x == 5) {
    return('STANDING')
  } else {
    return('LAYING')
  }
}
total$activity = sapply(total$activity, activity_dec)

### PART IV ### 
variable_names = names(total)
variable_names = gsub("-mean\\(\\)", "Average", variable_names)
variable_names = gsub("-std\\(\\)", "StandardDeviation", variable_names)
variable_names = gsub("^t", "Time_", variable_names)
variable_names = gsub("^f", "Freq_", variable_names)
variable_names = gsub("BodyBody", "Body", variable_names)
variable_names = gsub("Acc", "_Accelerometer_", variable_names)
variable_names = gsub("Gyro", "_Gyroscope_", variable_names)
variable_names = gsub("Mag", "_Magnitude_", variable_names)
variable_names = gsub("(r|e)__M", "\\1_M", variable_names)
variable_names = gsub("-(X|Y|Z)", "_\\1", variable_names)
variable_names = gsub("Jerk(Average|StandardDeviation)", "Jerk_\\1", variable_names)
colnames(total) = variable_names

### PART V ### 
setwd(original_path)
total2 = aggregate(total[,3:68], by= list(total[,1], total[,2]), mean)
colnames(total2) = names(total)
write.table(total2, file = "./tidy_data", row.names = FALSE)
variable_names = colnames(total2)
write.table(variable_names, file = "./data")



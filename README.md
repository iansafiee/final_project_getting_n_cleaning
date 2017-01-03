### The first part of the code reads in the train and tests sets and then merges them into one dataset:
  * Downloads the data and unzips it 
  * Sets the WD to the 'UCI HAR Dataset' folder
  * Reads in the train data
  * Reads in the test data
  * Creates a three temporary datasets using r-bind
  * Names their columns 
  * Combines the temporary datasets into one dataset using c-bind

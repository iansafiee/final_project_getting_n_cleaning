## The code is divided into five parts 
### The first part:
  * Downloads the data and unzips it 
  * Sets the working directory to the 'UCI HAR Dataset' folder
  * Reads in the train data
  * Reads in the test data
  * Creates a three temporary datasets using r-bind
  * Names their columns 
  * Combines the temporary datasets into one dataset using c-bind

### The second part:
  * Eliminates the columns from the dataset that do not contain MEAN or STANDARD DEVIATION
  
### The third part:
  * Creates a function to transform the values of the Activity variable into their respective activity names 
    ( 1 Walking | 2 Walking_Upstairs | 3 Walking_Downstairs | 4 Sitting | 5 Standing | 6 Laying )
  
### The fourth part:
  * Modifies the names of the column names by converting:
    * 'mean' into 'Average'
    * 'std' into 'Standard Deviation'
    * 't' into 'Time'
    * 'f' into 'Frequency'
    * 'BodyBody' into 'Body'
    * 'Acc' into 'Accelerometer'
    * 'Gyro' into 'Gyroscope'
    * 'Mag' into 'Magnitude'
  * Adds an underscore to make the column names readable

### The fifth part:
  * Creates a new dataset with the average of each variable for each activity and each subject.
  
    
    
    
    

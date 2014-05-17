## CODEBOOK

This codebook contains a description of
* the variables contained in the tidy.data.txt file, and the naming convention for the variables
* the procedure to obtain them used in the run_analysis.R code


### Variables

The tidy.data.txt contains, for each combination of subject (identified by an integer ranging from 1 to 30) and activity (WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) the average values of mean and standard deviation values of a variety of measurements, as follows.

* _columns 3 to 8_,    tBodyAccelerationMeanX,Y,Z	tBodyAccelerationStdX,Y,Z	
are mean and std deviations of the time domain signals of Body accelerations in the X,Y,Z axis

* _columns 9 to 14_,    tGravityAccelerationMeanX,Y,Z and tGravityAccelerationStdX,Y,Z	
are mean and std deviations of the time domain signals of Gravity accelerations in the X,Y,Z axis

* _columns 15 to 20_,    tBodyAccelerationJerkMeanX,Y,Z and tBodyAccelerationJerkStdX,Y,Z	
are mean and std deviations of the time domain signals of Body jerk signals accelerations in the X,Y,Z axis

* _columns 21 to 26_,    tBodyGyroscopeMeanX,Y,Z and tBodyGyroscopeStdX,Y,Z	
are mean and std deviations of the time domain signals from the gyroscope in the X,Y,Z axis

* _columns 27 to 32_,    tBodyGyroscopeJerkMeanX,Y,Z and tBodyGyroscopeJerkStdX,Y,Z	
are mean and std deviations of the time domain signals of jerk signals from the gyroscope in the X,Y,Z axis

* _columns 33 to 36_,    tBodyAccelerationMagMean,Std and tGravityAccelerationMagMean,Std		
are mean and std deviations of the magnitude of the Body/Gravity time domain signals from the accelerometer

* _columns 37 and 38_,    tBodyAccelerationJerkMagMean, Std		
same for Jerk signal

* _columns 39 to 42_,    tBodyGyroscopeMagMean,Std tBodyGyroscopeJerkMagMean,Std		
are mean and std deviations of the magnitude of the Body/Gravity time domain signals from the gyroscope

* _columns 43 to 48_,    fBodyAccelerationMeanX,Y,Z and fBodyAccelerationStdX,Y,Z	
same as columns 3:8, but for the frequency domain

* _columns 49 to 54_,    fBodyAccelerationJerkMeanX,Y,Z and fBodyAccelerationJerkStdX,Y,Z	
same as columns 15:20, but for the frequency domain

* _columns 55 to 60_,    fBodyGyroscopeMeanX,Y,Z and fBodyGyroscopeStdX,Y,Z	
same as columns 21:26, but for the frequency domain

* _columns 61 to 62_,    fBodyAccelerationMagMean fBodyAccelerationMagStd	
same as columns 33 and 34, but for the frequency domain

* _columns 63 to 68_,    fBodyBodyAccelerationJerkMagMean,Std	 fBodyBodyGyroscopeMagMean,Std	fBodyBodyGyroscopeJerkMagMean,Std	
the meaning of BodyBody is not documented in the features_info either...


#### Variable naming convention
Each variable is named with the following scheme

[domain][Physical Origin][Instrument][Jerk][Statistics][Direction]

where each block has the following meaning:
* [domain] can be either t (time) or f (frequency)
* [Physical Origin] can be either Body or Gravity
* [Instrument] can be either Acceleration or Gyroscope
* [Jerk], if present, indicates that the measure is a Jerk signal representing the body linear acceleration and angular velocity
* [Statistics] can be either Mean or Std (Standard Deviation)
* [Direction] can be either X,Y,Z or Mag in case of magnitude of the signal

### Procedure

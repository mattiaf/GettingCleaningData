## READ ME

This repository contains the following files:

* CodeBook.md
* README.md
* run_analysis.R
* tidy.data.txt

**run_analysis.R** is an R code that does the following:
1) Merges the UCIHAR test and training sets to create one data set 
2) Extracts measurements on the mean and std deviation for each measurement
3) Assignes descriptive activity names to name the activities in the data set
4) Produces a tidy data set (tidy.data.txt) with the averages of each variable for each combination of activity and subject.
For details on the code, please see the CodeBook.md file.

Once you have downloaded the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
you can run the code inside R, simply as:  
> source("run_analysis.R")


**CodeBook.md** describes the output file of run_analysis.R (tidy.data.txt), the variable and the work that has been done to clean up the data

**tidy.data.txt** is the ouput of run_analysis.R and it is a tab-delimited file containing mean values of the variables
described in the CodeBook for each activity and each subject.  
You can easily read the file inside R using:  
> tidydata = read.table("tidy.data.txt", header=TRUE)

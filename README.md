Getting and Cleaning Data - Course Project
==========================================

This repository contains a submission for the Coursera "Getting and Cleaning data" course project.  The project goal is to tidy and simplfy a dataset. 
The dataset  is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) which uses data from Smartphone accelerometer and gyroscope devices to identify the subjects physical activity type.

## Files
`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

`CodeBook.md` describes the source data, what was done to produce a tidy dataset, and the resulting variables.

`tidydata.txt` is the resulting tidy data file.

`README.md` is this file

## Intructions
Download the data set from  `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset` and extract into the R working directory.

The files will be in a directory `UCI HAR Dataset `

Comment out or change `setwd("~/R")` to reflect your working directory

Run the `run_analysis.R` script

The tidydatafile.txt will be in the working directory
Getting and Cleaning Data Course Project
========================================

Project of [Getting and Cleaning Data course on Coursera](https://www.coursera.org/course/getdata), Dec 2014 edition.

## Project Description
The purpose of this project is to implement all the knowledge acquired during the course "Getting and Cleaning Data" for getting, processing and cleaning raw data, to prepare a tidy data set that can be used for later analysis.  

The example is based in a collection of raw data adquired from the project ["Human Activity Recognition Using Smartphones Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

In short, the raw data have been captured from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

For more information about the whole experiment, please visit the project web http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and here you can donwload the raw data from the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Project Goals

The main goal is to obtain a tidy data set with the average of measurements based on mean and standard desviation of differents measures (linear acceleration, angular velocity, etc.) grouped by the subject and activity.

To carry out the process, we should create a script called  "run_analisys.R" and implement the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The outcome from this script is the tidy data set created in step 5, saved into a file called "avg_by_subjects_activities.txt"


## What you find in this repository

* __README.md__: this file
* __run_analysis.R__: R script to transform raw data set in a tidy one
* __CodeBook.md__: information about raw and tidy data set and elaboration made to
  transform them

## How to create the tidy data set

1. clone this repository: `git clone https://github.com/toniborrallo/getting-and-cleaning-data-project.git`
2. download [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. unzip raw data and copy the directory `UCI HAR Dataset` to the cloned repository root directory
4. open a R console and set the working directory to the repository root (use setwd())
5. source run_analisys.R script (it requires the plyr package): `source('run_analysis.R')`

In the repository root directory you can find the file `avg_by_subjects_activities.txt` with the tidy data set.

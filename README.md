# Getting and cleaning data with R: Assignment

This file is part of the submmission of the 4th week.
This homework consist a number of steps, starting from assigning a driectory and downloading the data files and ending by creating a tidy dateset.

# Description of the datasets
Dataset X outlines sensor signals data obtained through waist-mounted smartphone from 30 subjects. Dataset Y captures the different activities performed by the subjects.

# Data & treatment
The R codes used in this exercize facilitated the aggregation of extraction of frequency-based (mean and standard deviation) partial variables from the training and the testing datasets. 

- Varaibles and cases:

The means and standard diviations consititute the variables/columns.
Each row captures the different values recorded for a subject.

- The script (run_analysis.R) achieves the following:
 
 1- Assign a directory and downloading.
 
 2- Unzip and get the list of files.
 
 3- Read data into the variables.
 
 4- Label the training and testing datasets.
 
 5- Merge training and test datasets into dataset.
 
 6- Extract the value of means and standard deviations for each measurement.
 
 7- Use descriptive activity names to name the activities in the dataset.
 
 8- Create & save a new tidy dataset.

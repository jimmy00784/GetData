Gettting and Cleaning Data
==========================

Course Project
--------------
Author: Karim Lalani

This repo contains an R script file, run_analysis.R, along with the generated output, step5.txt for your reference.

In order to run the attached script, follow the below steps:

1. Extract the contents of the project zip file.
2. Download the script file into the extracted folder: "UCI HAR Dataset"
3. Start R and switch the working directory to the extracted folder such that "features.txt" and "activity_labels.txt" files along with "test" and "train" folders are in the working directory.
4. Run the script by issuing the below command
``source("run_analysis.R")``

Running the below command will result in creating of variables subject, X, and y as well as generate "step5.txt"
which stores the aggregates by Subject and Activity.
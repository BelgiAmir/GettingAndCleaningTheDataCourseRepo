## Cleaning the Samsung Data set - Explanations and instructions 

This repository contains a script called run_analysis.R
saving the script and running it from a folder that contains the unzipped data (e.g the "UCI HAR Dataset" folder)
will tidy up the data, select the mean and std variables and save it to a variable called relaventFeaturesFromData
The last two columns are the Activity name and subject number.

The script does the following:
1. Adds cloumns to the training and test datasets - One additional column contains the subject ID and the other column contains the Activity name. For more details see the code book.

2. Joins the test dataset and the train dataset into onedataset and saves the result to a variable called labledDataSet

3. Select the mean,std and activiy name and subject ID columns and saves the result to a variable called relaventFeaturesFromData

4. Summerizes the mean of each column grouped by the subject ID and the Activity name and saves the result to a variable called SummerizedData

5. Saves the SummerizedData data into a file in the directory the script is run from, the file is called SummerizedData.txt 

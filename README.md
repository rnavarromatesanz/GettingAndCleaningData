# GettingAndCleaningData
Repo to store the project created in the coursera course Getting and Cleaning Data

This Repo includes the information about the script uploaded; the points to take into account are the following

1. All the points requested in the project have been included in the unique script uploaded "run_analysis.R.
2. The script has been logically split in 5 parts.
3. The first line included the setwd() if you want to execute the script you need to update this path regarding where you have the files to be used in the project.

Point 1.

1. Inside the step 1 you have commented a line to install the library data.table, If needed.
2. In this step all the files are loaded into data frames
3. This data frames are combined first by column in order to get a unique data frame regarding if they are for train or test
4. Both Data frames are combined by row to combine both results

Point 2

1. A couple of arrays has been generated with the mean and the standard deviation, using the apply function by columns.

Point 4.

1. The steps 3 and 4 has been intentionally permuted in order to simplify the step 3
2. New names are provided to the data frame (Subject, Activity, and a number by each data 1,2,3,....).

Point 3.

1. The file with the activities names is loaded.
2. The old activities name that encloses a number, is substituted by the name activities that provide more information.

Point 5.

1. Finally the script gets the different users and activities.
2. A new data frame is created to store the measures that will be calculated later.
3. A double for is created in order to calculate the mean by subject and activities.
4. The new data frame is fulfilled with the values calculated.
5. And that's all at the end of this step, you should have a file with the tidy data set.
 

PS: I'm sorry for my English, it isn't my mother tongue.





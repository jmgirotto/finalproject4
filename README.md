#Girotto Final Project

This project is about the relationship between music and mental health.

##How to build report

1. Ensure all required R packages are installed (dplyr, readxl, ggplot2, knitr,
and rmarkdown)

2. Ensure your organizational structure matches the below, and that the output folders are originally empty. If they are not, run "make clean" in the terminal.

3. Now that your project is set up and clean, run "make" in the terminal window. This will run all of the rules in the Makefile and render the final report.

(You can also use the make rules to run individual Rscripts in the Terminal to render the report, but that is unnceccary and just using the "make" command is easier)

##Structure of Repository

`code` folder houses all code further outlined in the below code description.

`output` folder houses all outputs produced by the code, which is also further
describes in the below code description. This folder contains a ".gitkeep" this 
is just so the empty folder appears in the git hub repository for your use. 

`raw_data` folder holds the excel spreadsheet that hold all of the data used
for the project. Data is read into the code and RMarkdown document through that
folder

`Makefile` contains rules for building the final report, as well as a make clean

`Report.RMD` is the RMarkdown report that combines all of the data into a nicely
formated report

##Code Description

`code_01.R`
- This code creates a table showing the avg of reported mental health outcomes by music genre to visualize if certain genres are associated with higher self reported mental health disorders
-This code also saves the table as a `.rds` object called table1 in the `output` folder 
- This is where the code for creating the required table is located

`code_02.R`
- This code creates a boxplot of mean listening hours and self reported effect on mental health
- This code also saves the boxplot as a `.rds` object called figure1 in the
`output` folder
- This is where the code for creating the required figure is located

The below codes are not required, they are just other measures of interest

`code_03.R`
- This code creates a table showing age groups and self-reported impact of listening to music on mental health. I create age groups and then the table.
- This code saves the table as a `.rds` file called test1_table in the `output` folder

`code_03.1.R`
- This code reads in the table created in `code_03` from the `output` folder and then runs a Fisher's Test.
- This code saves the result of that test in a `.rds` file called test1_result in the `output` folder

`code_04.R`
- This code creates a table of self-reported identification as an Instrumentalist, Composer, or both and self-reported effect of listening to music on mental health.
- This code first creates categories and then the final table
- This code saves the created table as a `.rds` file called test2_table in the `output` folder

`code_04.1.R`
- This code reads in the table created in `code_04` from the `output` folder and then runs a Fisher's Test. 
- This code saves the result of that test in a `.rds` file called test2_result in the output folder
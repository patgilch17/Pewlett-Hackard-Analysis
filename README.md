# Pewlett-Hackard-Analysis
Module 7 - SQL

## Overview
The goal of this project is to help a company prepare for a so called "Silver Tsunami".  This essentially is attempting to prepare for a wave of longtime employees who may soon decide to retire.  To do this we have been asked to create lists of current employees who were born in the period January 1st, 1952 through December 31, 1955 as these employees would be the most likely candidates to be retiring soon.  Additionally we want to know how many of these retirees are coming from each title level (manager, staff, senior engineer, etc...).  Unfortunately, company data has been stored in a series of csv's with each file containing different potentially important information.  For example the Employees file contains all the pertinent personal information, however if we needed to understand each employees salary that would not be information found in this file.  So the main portion of our analysis involved pairing the necessary data from different files in order to answer the question, of how many employees could retire soon from each title level.  

Additionally, we were tasked with creating a separate list of names for employees who would be eligible to participate in a mentorship program based off a different birthday range of January 1st, 1965 to December 31st 1965.  This would be those people who are soon eligible to retire but also still would have time to train new employees.  To complete both these tasks we are reading our separate files into a SQL database and exporting the results of our queries to be used later.  Both the files for import and our exported files can be found in Data folder of this repository.

## Results
- We have 72458 employees in the given range of 1952-1955 that could retire (see below)
- The title levels of most concern is Senior Engineer at 25916 folled closely by Senior Staff at 24926 (see below)
- The title level with the fewest potential retirees is the manager level with only 2 employees (see below)
- There are 1549 candidates incuded as candidates for the mentorship program (see the mentorship_eligibilty.csv)

![Counts of Retirees by Title Level](Data/retire_titles.png)

## Summary
When just considering the number of people retiring from our 1952 - 1955 range we will need to replace over 70,000 employees in the near future, a rather daunting task.  Most of these positions will be in the upper levels as far as titles go so a part of a solution is to begin promoting from within where possible.  While this would require fulling those new vacancies we would be able to retain the talent of the employees being promoted which would help to ease in the transition caused by the "Silver Tsunami".  To help us determine this information it would be recommended to run an additional query to find those employees who are both young and experianced.  Both of these filters would need to be determined first but perhaps those employees over 35 who have 5 or more years experiance would be some of the intial candidates.

From our results we can see that there are currently about 1500 employees who would qualify for the mentorship program.  While this number is not insignificant it would be wise to consider ways to increase that number as 1500 is much less than 70,000 and not all of those 1500 may opt in for the program.  I would recommend running additional queries, first expand the age range regarding those who qualify for the mentorship program.  Second, run a separate query on how long employees have both worked at a company and in what title level.  Finally, it would be good to include on all of these queries the department of the employee in question.  500 mentors in the accounting department might be more than enough for them but if the engineering department only has 100, you unfortunately can't easily use the accounting mentors for engineering roles.

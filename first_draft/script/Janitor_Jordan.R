#Group Project
#Exploring the janitor package

#load libraries
library(janitor)
library(tidyverse)
library(here)
library(readxl)
library(kableExtra)

#bring in data
coralgrowth<-read.csv("first_draft/Data/CoralGrowth.csv")
view(coralgrowth) #FYI I renamed the file to be shorter

#a little data wrangling
coralsclean<-coralgrowth[,-c(5:14)] #get rid of the analysis on Excel
view(coralsclean)

#make initial corals table
coralsclean %>%
  kbl() %>%
  kable_classic()

#available functions
clean_names()
tabyl()
remove_empty() #note we have no empty cells
get_dupes()
excel_numeric_to_date() #note we have no date data

#let's try a few:

#clean_names
corals<-clean_names(coralgrowth)
view(corals) #this works, formats the names similarly

#make new corals table to see before and after
corals %>%
  kbl() %>%
  kable_classic() 

#tabyl
coralstable <- tabyl(corals, change_mg_cm2) #we can put the above object into a frequency table

library(dplyr) #we can use a pipe too (requires dplyr)
corals %>%
  tabyl(change_mg_cm2)

#make the frequency table
coralstable %>%
  kbl() %>%
  kable_classic()

#get_dupes
get_dupes(corals, change_mg_cm2) #not sure what this has done, 
                                 #but it's supposed to show duplicate data
                                 #don't think this dataset has any

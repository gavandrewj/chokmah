## code to prepare `clean_data` dataset goes here

########################### libraries and helper functions ####################

library(readxl)
library(sjlabelled)
library(tidyverse)
library(stringr)
library(janitor)
library(chokmah)
library(readr)
library(naniar)

############################ Create all value labels ###########################
# named vectors






############################ Read in list of variable names and labels #########






########################### read in data #######################################







########################### General Name Cleaning ##############################





########################### Remove records that violate data ###################







############################ Merge datasets ################################







########################### Check for missing data #############################


# check for missing data
missing_matrix = as.data.frame(is.na(dataset))

which_missing = function(varname,dataset){
  index = which(dataset[varname] == T)
  return(index)
}

# apply function to find all empty cells
missing_list = lapply(names(missing_matrix),which_missing,dataset = missing_matrix)


# convert the missing data list to a dataframe
missing_data = t(plyr::ldply(missing_list, rbind)) |> as.data.frame()


# rename the object
names(missing_data) = names(dataset)


# remove all columns that have no missing data
missing_data = missing_data |> janitor::remove_empty(which = 'cols')


# write the file and send to client
write_csv(missing_data,file = paste0(getwd(),'/missing_data.csv'))







########################################## Global Replacements #################





########################################## Cleaning ############################





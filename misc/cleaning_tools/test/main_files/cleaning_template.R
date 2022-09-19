## code to prepare `clean_data` dataset goes here


############################# paths ############################################

# set the working directory
setwd(paste0(getwd(),"/"))
meta_file = "meta_files/meta_data.xlsx"


########################### libraries and helper functions ####################

library(readxl)
library(sjlabelled)
library(tidyverse)
library(stringr)
library(janitor)
library(chokmah)
library(readr)
library(naniar)
library(googledrive)

############################ Create all value labels ###########################
# named vectors










########################### read in data #######################################







########################### Clean up names; Create meta data #####################
# perform this inside the script if feasible




########################### Drop unwanted columns








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
write_csv(
  missing_data,
  file = "missing_files/missing_data.csv"
  )



rm(
  missing_data,
  missing_list,
  missing_matrix
)



########################### Create variable types ##############################

char_vars = c()

for(name in char_vars){
  meta_data[meta_data$var_name == name,"var_type"] = "character"
  meta_data[meta_data$var_name == name,"interval_type"] = "Not Applicable"

}



factor_vars = c()

for(name in factor_vars){
  meta_data[meta_data$var_name == name,"var_type"] = "numeric"
  meta_data[meta_data$var_name == name,"interval_type"] = "discrete"

}



numeric_vars = c()

for(name in numeric_vars){
  meta_data[meta_data$var_name == name,"var_type"] = "numeric"
  meta_data[meta_data$var_name == name,"interval_type"] = "numeric"

}





date_vars = c()

for(name in date_vars){
  meta_data[meta_data$var_name == name,"var_type"] = "date"
  meta_data[meta_data$var_name == name,"interval_type"] = "discrete"

}



gps_vars = c()

for(name in gps_vars){
  meta_data[meta_data$var_name == name,"var_type"] = "numeric"
  meta_data[meta_data$var_name == name,"interval_type"] = "continuous"

}




########################################## Global Replacements #################
# only replacements which you are certain of
# care with missing values




########################################## Cleaning ############################











################################### filter the dataset & meta data file as needed #####



######################################## Write to other formats #######################

# SPSS
sjlabelled::write_spss(dataset,path = "cleaned_datafiles/clean_data.sav")

# STATA
sjlabelled::write_stata(dataset,path = "cleaned_datafiles/clean_data.dta",
                        version = 13)



########################### Write to R format ##################################


saveRDS(
  dataset,
  file = "cleaned_datafiles/clean_data.rds"
)


############################## Write the meta data files #######################

xlsx::write.xlsx(
  meta_data,
  file = "meta_files/meta_data.xlsx"
)

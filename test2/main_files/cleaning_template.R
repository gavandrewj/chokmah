## code to prepare `clean_data` dataset goes here


############################# paths ############################################

cleaning_folder = paste0(getwd(),"/data_cleaning/")
meta_path = "data_cleaning/meta_data.xlsx"


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










########################### read in data #######################################







########################### Create meta data; add variable names #####################
# perform this inside the script if feasible




########################### Drop unwanted columns





# create the meta data file
meta_data = data.frame(
  var_name = names(dataset),
  var_label = ,
  brief_desc = NA,
  var_type = NA,
  interval_type = NA,
  possible_invalid_codes =
  invalid_codes = NA,
  new_page = NA,
  table_break = NA
)



########################### Add variable label to the meta data #################
# assign the labels however best you want to






########################## create the var label file
# create this file which has specific entry code instead of relying on the external files
# make sure to comment out write statements
# leave only the source file to run and make the changes to the meta file that should
# have only the varname entry

to_write = paste0("meta_data[meta_data$var_name == '",meta_data$var_name,"','var_label'] = '",stringr::str_trim(meta_data$var_label),"'")

write(
  to_write,
  file = paste0(getwd(),"/gen_varlabels.R"),
  append = F
)

source(
  paste0(getwd(),"/gen_varlabels.R"),
)



########################### Add brief label to the meta data ####################
# add the brief label however you want to




########################## create the brief label file
# create this file which has specific entry code instead of relying on the external files
# make sure to comment out write statements
# leave only the source file to run and make the changes to the meta file that should


to_write = paste0("meta_data[meta_data$var_name == '",meta_data$var_name,"','brief_desc'] = '",stringr::str_trim(meta_data$brief_desc),"'")

write(
  to_write,
  file = paste0(getwd(),"/gen_brief_desc.R"),
  append = F
)

source(
  paste0(getwd(),"/gen_brief_desc.R"),
)








########################### Add possible invalid codes to the meta data ########
# add the possible invalid codes however you want








########################### create the invalid code file
# create this file which has possible invalid code instead of relying on the external files
# make sure to comment out write statements
# leave only the source file to run and make the changes to the meta file that should

to_write = paste0("meta_data[meta_data$var_name == '",meta_data$var_name,"','possible_invalid_codes'] = '",stringr::str_trim(meta_data$possible_invalid_codes),"'")

write(
  to_write,
  file = paste0(getwd(),"/gen_possible_invalid_codes.R"),
  append = F
)

source(
  paste0(getwd(),"/gen_possible_invalid_codes.R"),
)







########################### Add new page to the meta data ######################
# add new page however you want



########################### create the new page file
# create this file which has possible invalid code instead of relying on the external files
# make sure to comment out write statements
# leave only the source file to run and make the changes to the meta file that should

to_write = paste0("meta_data[meta_data$var_name == '",meta_data$var_name,"','new_page'] = '",stringr::str_trim(meta_data$new_page),"'")

write(
  to_write,
  file = paste0(getwd(),"/gen_new_page.R"),
  append = F
)

source(
  paste0(getwd(),"/gen_new_page.R"),
)






########################### Add table break to the meta data ##################



########################### create the new page file
# create this file which has possible invalid code instead of relying on the external files
# make sure to comment out write statements
# leave only the source file to run and make the changes to the meta file that should

to_write = paste0("meta_data[meta_data$var_name == '",meta_data$var_name,"','table_break'] = '",stringr::str_trim(meta_data$table_break),"'")

write(
  to_write,
  file = paste0(getwd(),"/gen_table_break.R"),
  append = F
)

source(
  paste0(getwd(),"/gen_table_break.R"),
)





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
  file = paste0(getwd(),))



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
  meta_data[meta_data$var_name == name,"var_type"] = "factor"
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
  meta_data[meta_data$var_name == name,"var_type"] = "GPS"
  meta_data[meta_data$var_name == name,"interval_type"] = "continuous"

}







########################### Create variable interval types ##############################




########################################## Global Replacements #################





########################################## Cleaning ############################





# SPSS
sjlabelled::write_spss(dataset,path = )

# STATA
sjlabelled::write_stata(dataset,path = )



########################### Write to R format ##################################


# convert all factor variables to factors
dataset = dataset |>
  mutate(
    across(
      .cols = factor_vars,
      .fns = sjlabelled::as_label
    )
  )

########################### Write to dataset folder ############################

clean_data = dataset

saveRDS(
  dataset,
  file =
)

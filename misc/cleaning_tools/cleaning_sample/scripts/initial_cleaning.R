
# add directory names
# import dataset and repair names

dataset <-  |>
  janitor::clean_names()



########################### Drop unwanted columns/rows











########################### Remove records that violate data ###################










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
readr::write_csv(
  missing_data,
  file = "/missing_files/missing_data.csv"
  )



rm(
  missing_data,
  missing_list,
  missing_matrix,
  which_missing
)



# ########################### Create variable types ##############################
#
# char_vars = c()
#
# for(name in char_vars){
#   meta_data[meta_data$var_name == name,"var_type"] = "character"
#   meta_data[meta_data$var_name == name,"interval_type"] = "Not Applicable"
#
# }
#
#
#
# factor_vars = c()
#
# for(name in factor_vars){
#   meta_data[meta_data$var_name == name,"var_type"] = "numeric"
#   meta_data[meta_data$var_name == name,"interval_type"] = "discrete"
#
# }
#
#
#
# numeric_vars = c()
#
# for(name in numeric_vars){
#   meta_data[meta_data$var_name == name,"var_type"] = "numeric"
#   meta_data[meta_data$var_name == name,"interval_type"] = "numeric"
#
# }
#
#
#
#
#
# date_vars = c()
#
# for(name in date_vars){
#   meta_data[meta_data$var_name == name,"var_type"] = "date"
#   meta_data[meta_data$var_name == name,"interval_type"] = "discrete"
#
# }
#
#
#
# gps_vars = c()
#
# for(name in gps_vars){
#   meta_data[meta_data$var_name == name,"var_type"] = "numeric"
#   meta_data[meta_data$var_name == name,"interval_type"] = "continuous"
#
# }
#



########################################## Global Replacements #################
# only replacements which you are certain of
# care with missing values







# set_up

library(googledrive)
library(tidyverse)

lapply(
  c("documents","misc","data_cleaning","downloads"),
  FUN = dir.create
)


# create data cleaning files
drive_mkdir(
  "SADP 2022"
)


# rename the directory appropriately
drive_rename(
  "new_client",
  name = "Covid-19 cohort"
)



# function to upload the default folder
drive_upload_folder <- function(folder, drive_path) {
  # Only call fs::dir_info once in order to avoid weirdness if the contents of the folder is changing
  contents <- fs::dir_info(folder, type = c("file", "dir"))
  dirs_to_upload <- contents %>%
    dplyr::filter(type == "directory") %>%
    pull(path)
  
  # Directly upload the files
  uploaded_files <- contents %>%
    dplyr::filter(type == "file") %>%
    pull(path) %>%
    purrr::map_dfr(googledrive::drive_upload, path = drive_path)
  
  # Create the next level down of directories
  dirs_to_upload %>%
    fs::path_rel(folder) %>%
    purrr::map(., googledrive::drive_mkdir, path = drive_path) %>%
    # Recursively call this function
    purrr::map2_dfr(dirs_to_upload, ., drive_upload_folder) %>%
    # return a dribble of what's been uploaded
    dplyr::bind_rows(uploaded_files) %>%
    invisible()
}


# upload the default folder
drive_upload_folder(
  folder = "C:/Users/gavin/Documents/R/sadp2022",
  drive_path = "~/SADP 2022/"
)




# set up cleaning drive

chokmah::create_cleaning_template(
  folder_name = "clean_data",
  path = getwd(),
  overwrite = F
)



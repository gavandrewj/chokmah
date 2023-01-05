# paths
# add directory
# skeleton path

skeleton_path = "clean_main_data/meta_files/skeleton_dataset.R"
meta_data = readRDS("clean_main_data/meta_files/meta_data.rds")
chokmah::gen_skeleton(dataset = "dataset",skeleton_path = skeleton_path,store_data_path = "clean_main_data/cleaned_datafiles")
dataset = readRDS('clean_main_data/cleaned_datafiles/dataset.rds')
source("clean_main_data/meta_files/conditionals.R")
source("clean_main_data/meta_files/skeleton_dataset.R")
source("clean_main_data/meta_files/var_sort_retain.R")

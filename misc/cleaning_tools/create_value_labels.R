# create value label scripts
library(tidyverse)


# read in the value label script file
value_codes_file = readxl::read_excel(
  path = "clean_main_data/meta_files/instrument_metadata.xlsx",
  sheet = 2
) |> tibble::tibble()


# create file to store the value labels
file.create(
  "clean_main_data/meta_files/value_labels.R"
)


# create the assignment stem that maps the value code to the value label
value_codes_file = value_codes_file |> 
  dplyr::mutate(
    stem = paste0(
      '"',label,'"' ,' = ', name
    )
  )



# create each value label and write to a external file
for(names in unique(value_codes_file$list_name)){

split_data = value_codes_file |> 
  dplyr::filter(
    list_name == names
  )



towrite = paste0(names," = c(\n", paste0(split_data$stem,collapse = ',\n'),"\n)\n")

readr::write_lines(
  towrite,
  file = "clean_main_data/meta_files/value_labels.R",
  append = T
)

}


# read in the value labels
source("clean_main_data/meta_files/value_labels.R")


# remove some junk
rm(
  towrite,
  names
  )






      
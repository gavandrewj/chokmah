#  set paths
path_xls = NULL # instrument xls form
path_store_values = NULL


# read in the value label script file
value_codes_file = readxl::read_excel(
  path = path_xls,
  sheet = "choices"
) |> tibble::tibble()


# create file to store the value labels
file.create(
  path_store_values
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
  file = path_store_values,
  append = T
)

}

# remove some junk
rm(
  towrite,
  names
  )







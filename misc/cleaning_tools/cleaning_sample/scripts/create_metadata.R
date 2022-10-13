# add directory name
# run value label scripts
source("/scripts/initial_cleaning.R")

source("/scripts/create_value_labels.R")


# read in the value label script file
# remove some basic noise rows
basic_meta = readxl::read_excel(
  path = "/scripts/instrument_metadata.xlsx",
  sheet = 1
) |> tibble::tibble() |>
  dplyr::filter(
    type != "begin_group" &
      type != "end_group" &
        type != "note" &
          type != "begin_repeat" &
            type != "end_repeat"
    )


basic_meta = basic_meta |>
  dplyr::mutate(
    value_label =
stringr::str_replace(
   string = type,
   pattern = "calculate|select_one|integer|text|select_multiple|decimal|start|end|username|deviceid|today|geopoint|time",
   replacement = ""
) |>
  stringr::str_replace(
    pattern = stringr::fixed("$"),
    replacement = ""
  ) |>
  stringr::str_replace(
    pattern = stringr::fixed("{"),
    replacement = ""
  ) |>
  stringr::str_replace(
    pattern = stringr::fixed("}"),
    replacement = ""
  ) |>
  stringr::str_replace(
    pattern = "q[0-9].*[0-9]",
    replacement = ""
  ) |>
  stringr::str_trim()
) |>
  dplyr::relocate(
    value_label,
    .after = type
  )


# generate pattern to remove value labels to get the question type
# question_type_pattern = paste0( unique(basic_meta$value_label)[!unique(basic_meta$value_label) %in% ""] ,collapse = "|")


basic_meta = basic_meta |>
  dplyr::mutate(
    question_type =
      stringr::str_extract(
        string = type,
        pattern = "calculate|select_one|integer|text|select_multiple|decimal|start|end|username|deviceid|today|geopoint|time"
      )
  ) |>
  dplyr::relocate(
    question_type,
    .after = type
  )






basic_meta = basic_meta |>
  dplyr::select(
    type,
    question_type,
    value_label,
    name,
    label
  ) |>
  dplyr::mutate(
    name = name |> janitor::make_clean_names()
  ) |>
  dplyr::rename(
    var_name = name,
    var_label = label
  )

saveRDS(
  basic_meta,
  "/scripts/base_meta_data.rds"
)



# create a datafile where for each variable in the dataset you will have the
# value label assigned as well as question type.

# match the varname to the variable type to start things off then use an excel file
# to drag down and finish the assignment..or..fucking do it yourself and have
# the code to show your fuck ups and verify it by printing out the excel files



meta_data = data.frame(
  var_name = dataset |>
    janitor::clean_names() |>
    names(),
  question_type = "",
  value_label = "",
  var_conditional = "",
  var_cleaning = "",
  var_label = "",
  recode = F,
  brief_desc = "",
  var_type = "",
  interval_type = "",
  possible_invalid_codes = "",
  invalid_codes = "",
  new_page = F,
  table_break = NA,
  var_special = NA
)

for(names in basic_meta$var_name){

meta_data$question_type[which(meta_data$var_name == names)] = basic_meta$question_type[which(basic_meta$var_name == names)]
meta_data$value_label[which(meta_data$var_name == names)] = basic_meta$value_label[which(basic_meta$var_name == names)]
meta_data$var_label[which(meta_data$var_name == names)] = basic_meta$var_label[which(basic_meta$var_name == names)]

}


rm(basic_meta)

instrument_metadata <- readxl::read_excel(
  "/scripts/instrument_metadata.xlsx",
  sheet = "meta_data") |>
  dplyr::filter(
    var_name != "note0" & var_name != "note2" & var_name != "notes"
  )

meta_data = meta_data |>
  dplyr::mutate(
    var_label = instrument_metadata$variable_label,
    question_type = instrument_metadata$question_type,
    value_label = instrument_metadata$value_label,
    var_conditional = instrument_metadata$var_conditional,
    var_cleaning = instrument_metadata$var_cleaning,
    recode = instrument_metadata$recode,
    possible_invalid_codes = instrument_metadata$possible_invalid_codes
  )

rm(instrument_metadata)


meta_data = meta_data |>
  dplyr::mutate(
    var_type = ifelse(question_type == "select_one" | question_type == "indicator" | question_type == "integer" | question_type == "decimal" | question_type == "calculate","numeric",var_type),
    var_type = ifelse(question_type == "text","character",var_type),
    question_type = ifelse(question_type == "today" | question_type == "time" | question_type == "start" | question_type == "end","date",question_type),
    interval_type = ifelse(question_type == "select_one" | question_type == "indicator","discrete",interval_type),
    interval_type = ifelse(question_type == "integer" | question_type == "decimal" | question_type == "calculate","continuous",interval_type),
    var_type = ifelse(question_type == "date","character",var_type),
    possible_invalid_codes = ifelse(is.na(possible_invalid_codes),"-3,-99,-1,-2",possible_invalid_codes)



    # possible_invalid_codes = "-3,-1,-99"
  ) |>
  dplyr::filter(
    # question_type == "select_one" | question_type == "indicator" | question_type == "text" |
      # question_type == "integer" | question_type == "decimal"
     # question_type != "select_multiple"
  )



meta_data$question_type[stringr::str_detect(meta_data$var_name,pattern = "gps")] = "gps"
meta_data$question_type[meta_data$var_name %in% c("id","index","status","submission_time","submitted_by","tags","uuid","validation_status")] = "misc"




# add the directory names
xlsx::write.xlsx(
  meta_data,
  file = "/scripts/meta_data.xlsx"
)

saveRDS(
  meta_data,
  file = "/scripts/meta_data.rds"
)

saveRDS(
  dataset,
  "/clean_data/dataset.rds"
)
rm(dataset)



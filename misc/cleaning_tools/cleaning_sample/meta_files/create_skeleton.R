# paths

# data path
path_data = NULL


gen_cleaning_skeleton = function(dataset,path_data){

  file.create(
    "clean_main_data/meta_files/code_skeleton.R"
  )

  towrite = c(
    "
    source('clean_main_data/meta_files/value_labels.R')

    dataset <- readxl::read_excel(",path_data,") |>
    janitor::clean_names()


    dataset = dataset |>
      dplyr::filter(
        q0_0 == 1
      )

    "
  )

  readr::write_lines(
    towrite,
    file = "clean_main_data/meta_files/code_skeleton.R",
    append = T
  )

for(var_name in meta_data[["var_name"]]){



  value_label = meta_data$value_label[which(meta_data$var_name == var_name)]
  var_label = meta_data$var_label[which(meta_data$var_name == var_name)]
  var_conditional = meta_data$var_conditional[which(meta_data$var_name == var_name)]

if(
  meta_data$question_type[which(meta_data$var_name == var_name)] == "select_one" &
  meta_data$recode[which(meta_data$var_name == var_name)] == T |
  meta_data$question_type[which(meta_data$var_name == var_name)] == "indicator" &
  meta_data$recode[which(meta_data$var_name == var_name)] == T){

towrite = paste0(
 " dataset <- read_excel('clean_main_data/downloads/SADP2022_V3_-_all_versions_-_False_-_2022-09-14-08-42-49.xlsx')

 source('clean_main_data/meta_files/var_labels.R')


##########   variable_info


chokmah::clean_discrete(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>
  dplyr::mutate(
      ",var_name," = dplyr::recode(
                              ",var_name,",
                              !!!",var_label,"
                              )) |>

  dplyr::mutate(
                ",var_name," = sjlabelled::set_labels(
                                                ",var_name,",
                                                labels =
                                                ",value_label,"
                                                  ) |>
                  sjlabelled::set_label(
                     label = '",var_label,"'
                  ))

chokmah::clean_discrete(",dataset,"[['",var_name,"']]) \n\n\n"
)

readr::write_lines(
  towrite,
  file = "clean_main_data/meta_files/code_skeleton.R",
  append = T
)

} else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "select_one" &
          meta_data$recode[which(meta_data$var_name == var_name)] == F |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "indicator" &
          meta_data$recode[which(meta_data$var_name == var_name)] == F){


  towrite = paste0(

    "

    ##########   variable_info
  ",
  var_conditional
  ,"

chokmah::clean_discrete(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>

  dplyr::mutate(
                ",var_name," = sjlabelled::set_labels(
                                                ",var_name,",
                                                labels =
                                                ",value_label,"
                                                  ) |>
                  sjlabelled::set_label(
                     label = '",var_label,"'
                  ))

chokmah::clean_discrete(",dataset,"[['",var_name,"']]) \n\n\n"
  )


  readr::write_lines(
    towrite,
    file = "clean_main_data/meta_files/code_skeleton.R",
    append = T
  )

} else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "text"){


  towrite = paste0(

    "

    ##########   variable_info
  ",
  var_conditional
  ,"

chokmah::clean_discrete(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>

  dplyr::mutate(
                ",var_name," = ",var_name," |>
                     sjlabelled::set_label(
                     label = '",var_label,"'
                  ))

chokmah::clean_discrete(",dataset,"[['",var_name,"']]) \n\n\n"
  )


  readr::write_lines(
    towrite,
    file = "clean_main_data/meta_files/code_skeleton.R",
    append = T
  )

} else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "integer" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "decimal"){


  towrite = paste0(

    "

    ##########   variable_info
  ",
  var_conditional
  ,"

chokmah::clean_continuous(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>

  dplyr::mutate(
                ",var_name," = ",var_name," |>
                     sjlabelled::set_label(
                     label = '",var_label,"'
                  ))

chokmah::clean_continuous(",dataset,"[['",var_name,"']]) \n\n\n"
  )


  readr::write_lines(
    towrite,
    file = "clean_main_data/meta_files/code_skeleton.R",
    append = T
  )

} else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "deviceid" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "end" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "geopoint" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "start" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "time" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "today" |
          meta_data$question_type[which(meta_data$var_name == var_name)] == "username"){


  towrite = paste0(

    "

    ##########   variable_info
  ",
  var_conditional
  ,"


",dataset," = ",dataset," |>

  dplyr::mutate(
                ",var_name," = ",var_name," |>
                     sjlabelled::set_label(
                     label = '",var_label,"'
                  ))

chokmah::clean_continuous(",dataset,"[['",var_name,"']]) \n\n\n"
  )


  readr::write_lines(
    towrite,
    file = "clean_main_data/meta_files/code_skeleton.R",
    append = T
  )

}





}

  towrite = c(
    "
    saveRDS(
    dataset,
    'clean_main_data/cleaned_datafiles/dataset.rds'
    )

    "
  )

  readr::write_lines(
    towrite,
    file = "clean_main_data/meta_files/code_skeleton.R",
    append = T
  )

}

gen_cleaning_skeleton(dataset = "dataset")

source("clean_main_data/meta_files/code_skeleton.R")

#' Title
#'
#' @param dataset
#' @param skeleton_path
#'
#' @return
#' @export
#'
#' @examples
gen_skeleton = function(dataset,skeleton_path){

  file.create(
    skeleton_path
  )

  towrite = c(
    "

    "
  )

  readr::write_lines(
    towrite,
    file = skeleton_path,
    append = T
  )

  for(var_name in meta_data[["var_name"]]){



    value_label = meta_data$value_label[which(meta_data$var_name == var_name)]
    var_label = meta_data$var_label[which(meta_data$var_name == var_name)]
    var_conditional = meta_data$var_conditional[which(meta_data$var_name == var_name)]
    var_cleaning = meta_data$var_cleaning[which(meta_data$var_name == var_name)]

    if(
      meta_data$question_type[which(meta_data$var_name == var_name)] == "select_one" &
      meta_data$recode[which(meta_data$var_name == var_name)] == T |
      meta_data$question_type[which(meta_data$var_name == var_name)] == "indicator" &
      meta_data$recode[which(meta_data$var_name == var_name)] == T){

      towrite = paste0(

        "

    ##########  ",var_label,"

  ",
  var_conditional,"

  ",
  var_cleaning,"

chokmah::clean_discrete(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>
  dplyr::mutate(
      ",var_name," = dplyr::recode(
                              ",var_name,",
                              !!!",value_label,"
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
        file = skeleton_path,
        append = T
      )

    } else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "select_one" &
              meta_data$recode[which(meta_data$var_name == var_name)] == F |
              meta_data$question_type[which(meta_data$var_name == var_name)] == "indicator" &
              meta_data$recode[which(meta_data$var_name == var_name)] == F){


      towrite = paste0(

        "

    ##########  ",var_label,"

  ",
  var_conditional,"

  ",
  var_cleaning,"

chokmah::clean_discrete(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>

  dplyr::mutate(
                ",var_name," = ",var_name," |>
                                         as.numeric() |>
                                             sjlabelled::set_labels(
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
        file = skeleton_path,
        append = T
      )

    } else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "text"){


      towrite = paste0(

        "

    ##########  ",var_label,"

  ",
  var_conditional,"

  ",
  var_cleaning,"

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
        file = skeleton_path,
        append = T
      )

    } else if(meta_data$question_type[which(meta_data$var_name == var_name)] == "integer" |
              meta_data$question_type[which(meta_data$var_name == var_name)] == "decimal" |
              meta_data$question_type[which(meta_data$var_name == var_name)] == "calculate"
    ){


      towrite = paste0(

        "

    ##########  ",var_label,"

  ",
  var_conditional,"

  ",
  var_cleaning,"

chokmah::clean_continuous(",dataset,"[['",var_name,"']])

",dataset," = ",dataset," |>

  dplyr::mutate(
                ",var_name," = ",var_name," |>
                 as.numeric() |>
                     sjlabelled::set_label(
                     label = '",var_label,"'
                     ) |>
                     sjlabelled::set_labels(
                     labels = ",value_label,"
                     )
                  )

chokmah::clean_continuous(",dataset,"[['",var_name,"']]) \n\n\n"
      )


      readr::write_lines(
        towrite,
        file = skeleton_path,
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

    ##########  ",var_label,"

  ",
  var_conditional,"

  ",
  var_cleaning,"


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
        file = skeleton_path,
        append = T
      )

    }





  }

  towrite = paste0(

    "
    ",dataset," = ",dataset," |>
    dplyr::mutate(
    dplyr::across(
    .cols = meta_data |> dplyr::filter(value_label == 'empty') |> dplyr::pull(var_name),
      .fns = ~ sjlabelled::remove_labels(.x,labels = 'NA')
    )
    )


    saveRDS(",dataset,",'clean_main_data/cleaned_datafiles/",dataset,".rds')
    "
  )

  readr::write_lines(
    towrite,
    file = skeleton_path,
    append = T
  )

}

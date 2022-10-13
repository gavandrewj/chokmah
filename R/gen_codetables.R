#' Title
#'
#' @param dataset
#' @param varname
#'
#' @return
#' @export
#'
#' @examples
gen_codetables = function(dataset,varname,meta_path){


  if(as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"])){

    # get the initial tabulation of all codes
    codes = table(dataset[[varname]]) |>
      as.matrix() |>
      as.data.frame()

    codes$value =  rownames(codes)
    rownames(codes) = NULL

    # compute the frequency
    codes = codes |>
      dplyr::rename(
        freq = V1
      ) |>
      dplyr::mutate(
        valid = freq,
        freq = paste(freq," (",round(freq/sum(freq,na.rm = T) * 100,1),"%",")",sep = "")
      )

    # pull the valid codes and remove the counts from the invalid from the valid column
    invalid_codes = chokmah::invalid_code_finder(
      variable = varname,
      dataset = dataset,
      meta_path = meta_path,
      write_meta = T
    )

    codes$valid[which(codes$value %in% invalid_codes)] = NA

    # compute counts of valid and non-valid
    count_valid = sum(codes$valid,na.rm = T)
    count_invalid = nrow(dataset) - count_valid


  } else if(as.logical(meta_data[meta_data[['var_name']] == varname,"question_type"] == "text")){

    # get the general tabulation
    codes = table(dataset[[varname]]) |>
      as.matrix() |>
      as.data.frame()

    codes$label =  rownames(codes)
    rownames(codes) = NULL

    # compute the frequency
    codes = codes |>
      dplyr::rename(
        freq = V1
      ) |>
      dplyr::mutate(
        valid = freq,
        freq = paste(freq," (",round(freq/sum(freq,na.rm = T) * 100,1),"%",")",sep = "")
      )


    # search for invalid codes, remove the invalid counts from the valid column
    invalid_codes = chokmah::invalid_code_finder(
      variable = varname,
      dataset = dataset,
      meta_path = meta_path,
      write_meta = T
    )


    codes$valid[which(codes$label %in% invalid_codes)] = NA


    # compute the counts of valid and invalid
    count_valid = sum(codes$valid,na.rm = T)
    count_invalid = nrow(dataset) - count_valid

    codes = codes |>
      dplyr::mutate(
        valid = paste(round(valid/sum(valid,na.rm = T) * 100,1),"%",sep = "")
      )



    # neaten table by removing na and such
    codes[is.na(codes)] = "-"
    codes[codes == "NA%"] = "-"
    codes[codes == "."] = ". (M)"
    codes[codes$value == -99 ,"valid"] = "-"
    codes[codes$value == -1 ,"valid"] = "-"
    codes[codes$value == -2 ,"valid"] = "-"
    codes[codes$value == -3 ,"valid"] = "-"


    # combine the freq and % columns and remove the percent column, rename the columns
    codes = codes |>
      dplyr::rename(
        Label = label,
        Frequency = freq,
        # "%" = percent,
        "Valid %" = valid
      ) |> dplyr::relocate(
        Label,
        .before = Frequency
      )





  } else if(
    as.logical(meta_data[meta_data[['var_name']] == varname,"question_type"] == "date")
    ){

    # get the general tabulation
    codes = table(dataset[[varname]]) |>
      as.matrix() |>
      as.data.frame()

    codes$label =  rownames(codes)
    rownames(codes) = NULL

    # compute the frequency
    codes = codes |>
      dplyr::rename(
        freq = V1
      ) |>
      dplyr::mutate(
        valid = freq,
        freq = paste(freq," (",round(freq/sum(freq,na.rm = T) * 100,1),"%",")",sep = "")
      )


    # search for invalid codes, remove the invalid counts from the valid column
    invalid_codes = chokmah::invalid_code_finder(
      variable = varname,
      dataset = dataset,
      meta_path = meta_path,
      write_meta = T
    )


    codes$valid[which(codes$label %in% invalid_codes)] = NA


    # compute the counts of valid and invalid
    count_valid = sum(codes$valid,na.rm = T)
    count_invalid = nrow(dataset) - count_valid

    codes = codes |>
      dplyr::mutate(
        valid = paste(round(valid/sum(valid,na.rm = T) * 100,1),"%",sep = "")
      )



    # neaten table by removing na and such
    codes[is.na(codes)] = "-"
    codes[codes == "NA%"] = "-"
    codes[codes == "."] = ". (M)"
    codes[codes$value == -99 ,"valid"] = "-"
    codes[codes$value == -1 ,"valid"] = "-"
    codes[codes$value == -2 ,"valid"] = "-"
    codes[codes$value == -3 ,"valid"] = "-"


    # combine the freq and % columns and remove the percent column, rename the columns
    codes = codes |>
      dplyr::rename(
        Label = label,
        Frequency = freq,
        # "%" = percent,
        "Valid %" = valid
      ) |> dplyr::relocate(
        Label,
        .before = Frequency
      )

    codes = codes[codes$Label %in% invalid_codes,] |>
      dplyr::select(Label,Frequency)

    # count_invalid = sum(codes$V1[match(invalid_codes,codes$label)],na.rm = T)
    # count_valid = nrow(dataset) - sum(codes$V1[match(invalid_codes,codes$label)],na.rm = T)



    # add the format

    sum_data =   data.frame(time_var = lubridate::ymd(dataset[[varname]][!dataset[[varname]] %in% invalid_codes]))


    sum_tab = sum_data |>
      tidyr::drop_na() |>
      timetk::tk_summary_diagnostics() |>
      dplyr::select(
        start,
        end,
        tzone
      ) |>
      dplyr::mutate(
        count_valid = count_valid,
        count_invalid = count_invalid,
        "Format" = 'YYYY-MM-DD',
        tzone = meta_data[meta_data[['var_name']] == varname,"time_zone"] |> as.character()
      ) |>
      dplyr::rename(
        Start = start,
        End = end,
        "Time Zone" = tzone
      ) |>
      dplyr::relocate(
        count_valid:count_invalid,
        .before = Start
      ) |>
      dplyr::rename(
        "Valid" = count_valid,
        "Invalid" = count_invalid
      )


  } else if(
   as.logical(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "select_one" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "indicator" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "integer" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "calculate" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "decimal"
   )
  ){


    # get the values to start off with

    codes = table(dataset[[varname]]) |>
      as.matrix() |>
      as.data.frame()

    codes$value =  rownames(codes)
    rownames(codes) = NULL

    codes = codes |>
      dplyr::rename(
        freq = V1
      ) |>
      dplyr::mutate(
        valid = freq,
        freq = paste(freq," (",round(freq/sum(freq,na.rm = T) * 100,1),"%",")",sep = "")
      )


    # search for invalid codes

    invalid_codes = chokmah::invalid_code_finder(
      variable = varname,
      dataset = dataset,
      meta_path = meta_path,
      write_meta = T
    )


    codes$valid[which(codes$value %in% invalid_codes)] = NA



    count_valid = sum(codes$valid,na.rm = T)
    count_invalid = nrow(dataset) - count_valid

    codes = codes |>
      dplyr::mutate(
        valid = paste(round(valid/sum(valid,na.rm = T) * 100,1),"%",sep = "")
      )



    # neaten table by removing na and such
    codes[is.na(codes)] = "-"
    codes[codes == "NA%"] = "-"
    codes[codes == "."] = ". (M)"
    codes[codes$value == -99 ,"valid"] = "-"
    codes[codes$value == -1 ,"valid"] = "-"
    codes[codes$value == -2 ,"valid"] = "-"
    codes[codes$value == -3 ,"valid"] = "-"




    # combine the freq and % columns and remove the percent column, rename the columns
    codes = codes |>
      dplyr::rename(
        Value = value,
        Frequency = freq,
        # "%" = percent,
        "Valid %" = valid
      ) |> dplyr::relocate(
        Value,
        .before = Frequency
      ) |>
      dplyr::mutate(
        Value = Value |> as.numeric()
      ) |>
      dplyr::arrange(
        Value
      )




    # IF there are labels for this thing then get them and attach
    if(!rlang::is_null(sjlabelled::get_values(dataset[[varname]]))){



      codes_table = data.frame(
        values = sjlabelled::get_values(dataset[[varname]]),
        labels = sjlabelled::get_labels(dataset[[varname]])
      )


      codes$label = codes_table$labels[match(codes$Value,codes_table$values)]

      # if the var type is interval then remove the label column and rename label as the values

      codes = codes |>
        dplyr::relocate(
          label,
          .after = "Value"
        ) |>
        dplyr::rename(Label = label)

    }

  }




############## prepare the summary metric tables #################################


  if(as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"])){

    sum_tab = data.frame(
      Valid = count_valid,                             # add the valid and invalid counts
      Invalid = count_invalid
    )

  } else if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "decimal" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "calculate" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "integer"
  ){


    if(!rlang::is_null(sjlabelled::get_values(dataset[[varname]]))){
    codes = codes[codes$Label %in% codes_table$labels,]
    } else {
    codes = data.frame(
      values = "Do not report"
    )

    }


    # remove the non-valid data
    # note the danger with how this is treated for continuous values
    sum_data =   dataset[[varname]][!dataset[[varname]] %in% invalid_codes] |> as.numeric()


    # create the summary table
    sum_tab = tibble::tibble(
      sum_stat = names(summary(sum_data)),                      #compute the base summary table
      stat = summary(sum_data |> as.numeric()
      )) |>
      # rbind(
      #   c("Mode",Modes(dataset[[varname]]))
      # )  |>
      # rbind(
      #   c("SD",sd(sum_data))                                    #append the standard deviation
      # ) |>
      t() |>
      as.data.frame()

    names(sum_tab) = sum_tab[1,]                             #rename the columns
    sum_tab =  sum_tab[-1,]

    sum_tab = sum_tab |>
      dplyr::select(!Mean) |>

      dplyr::mutate(
        valid = count_valid,                             # add the valid and invalid counts
        invalid = count_invalid
      ) |>
      dplyr::rename(
        Min = Min.
      ) |>
      dplyr::relocate(valid,.before = Min) |>                       #relocate and rename some stuff
      dplyr::relocate(invalid,.before = Min) |>
      dplyr::rename(
        "Valid" = valid,
        "Invalid" = invalid,
        "Q1" = "1st Qu.",
        "Q3" = "3rd Qu.",
        Max = "Max."
      ) |>
      dplyr::mutate(
        dplyr::across(
          .cols = dplyr::everything(),                                #convert to numeric and then round the columns
          .fns = as.numeric
        )
      ) |>
      dplyr::mutate(
        dplyr::across(
          .cols = dplyr::everything(),
          .fns = ~round(.x,2)
        )
      )



  } else if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "select_one" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "indicator"
  ){

    # remove the non-valid data
    sum_data =   dataset[[varname]][!dataset[[varname]] %in% invalid_codes]

    sum_tab = data.frame(
      sum_stat = names(summary(sum_data)),
      stat = summary(sum_data) |> as.numeric()
    ) |>
      rbind(
        c("Mode",paste0(chokmah::find_modes(sum_data),collapse = ",")) #find the mode and append
      ) |>
      dplyr::filter(
        sum_stat != "Mean"                   #remove the mean
      ) |> t() |>
      as.data.frame()

    names(sum_tab) = sum_tab[1,]                     #rename the columns
    sum_tab =  sum_tab[-1,]

    sum_tab = sum_tab |>
      dplyr::mutate(
        valid = count_valid,
        invalid = count_invalid                   #add the invalid counts and the valid counts
      ) |>
      dplyr::rename(
        Min = Min.,
        "Valid" = valid,
        "Invalid" = invalid,                         #rename some stuff
        "Q1" = "1st Qu.",
        "Q3" = "3rd Qu.",
        Max = "Max."
      ) |>
      dplyr::relocate(Valid,.before = Min) |>            #relocate some stuff
      dplyr::relocate(Invalid,.before = Min)

  } else if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "text"
  ){


    # remove the non-valid data
    sum_data =   dataset[[varname]][!dataset[[varname]] %in% invalid_codes]

    sum_tab = data.frame(
      valid = count_valid,
      invalid = count_invalid,
      mode = paste0(chokmah::find_modes(sum_data),collapse = ",")
    ) |>
      dplyr::rename(
        Valid = valid,
        Invalid = invalid,
        Mode = mode
      )

    # sum_tab[sum_tab == "NA"] = "-"

    if(sum(is.na(sum_data))>0){
      sum_tab = sum_tab |>
        dplyr::mutate(
          Unaccounted = sum(is.na(sum_data))
        )
    }


  }


  # sumtab_list = append(sumtab_list,list(sum_tab))


  # re-order the codes table row such that the invalid codes are on top

  if(paste0(invalid_codes,collapse = "") != "" & meta_data[meta_data[['var_name']] == varname,"question_type"] == "text"){

    codes =
      rbind(
        codes[which(codes$Label %in% invalid_codes),],
        codes[which(!codes$Label %in% invalid_codes),]
    )
  }



  if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "calculate" & !as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"]) |
     meta_data[meta_data[['var_name']] == varname,"question_type"] == "integer" & !as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"]) |
     meta_data[meta_data[['var_name']] == varname,"question_type"] == "decimal" &  !as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"]) ){

    # sum_table_one = sum_tab[,1:5]
    # sum_table_two = sum_tab[,6:9]


    # create the rain chart for the numeric display

    data_set = data.frame(
      sum_var = sum_data
    )

    if(sum(is.na(data_set)) != nrow(data_set)){
    numeric_rain_plot = rain_plot(
      dataset = data_set,
      varname = "sum_var"
    ) +
      ggplot2::theme(
        axis.ticks.y  = ggplot2::element_blank(),
        axis.text.y = ggplot2::element_blank()) +

      if(sum(data_set$sum_var < 0,na.rm = T) != 0){
      ggplot2::scale_y_continuous(labels =  scales::comma,oob = scales::squish)
      } else {
        ggplot2::scale_y_continuous(labels =  scales::comma)
      }

    } else {
      numeric_rain_plot = "&nbsp;"
}


    if(as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"])){
      codes =  data.frame(
        Valid = count_valid,                             # add the valid and invalid counts
        Invalid = count_invalid
      )
    }

    return(
      list(
        plot = numeric_rain_plot,
        value_table = codes,
        # sum_table_one = sum_table_one,
        # sum_table_two = sum_table_two
        sum_table = sum_tab
      )
    )

  } else {


    if(as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"])){
      codes =  data.frame(
        Valid = count_valid,                             # add the valid and invalid counts
        Invalid = count_invalid
      )
    }


  return(
    list(
      value_table = codes,
      sum_table = sum_tab
    )
  )

  }
}



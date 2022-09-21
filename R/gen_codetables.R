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


  if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "text"){

    codes = table(dataset[[varname]]) |>
      as.matrix() |>
      as.data.frame()

    codes$label =  rownames(codes)
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
      write_meta = F
    )


    codes$valid[which(codes$label %in% invalid_codes)] = NA



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

    sum_tab[sum_tab == "NA"] = "-"


  } else if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "date"){

    codes = data.frame(
      values = sjlabelled::get_values(dataset[[varname]]),
      labels = sjlabelled::get_labels(dataset[[varname]])
    ) |>
      dplyr::filter(
        labels != "Valid Date"
      ) |>
      dplyr::mutate(
        freq = NA
      )

    invalid_codes = codes$values


    for(invalid_code in codes$values){
      codes[which(codes$values == invalid_code),'freq'] =   sum(dataset[[variable]] %in% invalid_code,na.rm = T)
    }



    codes[nrow(codes)+1,] = c(
      "",
      "Valid Date",
      nrow(dataset) - sum(codes$freq,na.rm = T)
    )




    count_invalid = nrow(dataset) - as.numeric(codes$freq[which(codes$labels == "Valid Date")])


    codes = codes  |>
      dplyr::mutate(
        freq = freq |> as.numeric(),
        freq = paste0(freq," (",paste(round(freq/sum(freq,na.rm = T) * 100,1),"%",sep = ""),")")
      ) |>
      dplyr::rename(
        Values = values,
        Labels = labels,
        Frequency = freq
      )



    # add the format

    sum_data =   data.frame(time_var = lubridate::ymd(dataset[[varname]][!dataset[[varname]] %in% invalid_codes]))


    sum_tab = sum_data |>
      timetk::tk_summary_diagnostics() |>
      dplyr::select(
        start,
        end,
        units,
        tzone
      ) |>
      dplyr::mutate(
        "Format" = 'date_format',
        count_invalid = count_invalid
      ) |>
      dplyr::rename(
        Start = start,
        End = end,
        Units = units,
        "Time Zone" = tzone
      ) |>

      dplyr::relocate(
        count_invalid,.before = Start
      ) |>
      dplyr::rename(
        "Invalid Count" = count_invalid
      )


  } else if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "select_one" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "indicator" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "integer" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "calculate" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "decimal"
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
      write_meta = F
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

  # prepare the summary metric tables
  if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "decimal" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "calculate" |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "integer"
  ){


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
      rbind(
        c("SD",sd(sum_data))                                    #append the standard deviation
      ) |>
      t() |>
      as.data.frame()

    names(sum_tab) = sum_tab[1,]                             #rename the columns
    sum_tab =  sum_tab[-1,]

    sum_tab = sum_tab |>
      dplyr::mutate(
        valid = count_valid,                             # add the valid and invalid counts
        invalid = count_invalid
      ) |>
      dplyr::rename(
        Min = Min.
      ) |>
      dplyr::relocate(valid,.before = Min) |>                       #relocate and rename some stuff
      dplyr::relocate(invalid,.before = Min) |>
      dplyr::relocate(Mean,.before = SD) |>
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
  }


  # sumtab_list = append(sumtab_list,list(sum_tab))

  return(
    list(
      value_table = codes,
      sum_table = sum_tab
    )
  )

}



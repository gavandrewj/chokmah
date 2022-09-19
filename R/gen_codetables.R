#' Title
#'
#' @param dataset
#' @param varname
#'
#' @return
#' @export
#'
#' @examples
gen_codetables = function(dataset,varname,meta_path,special_vartype = ""){



  if(special_vartype == "date"){

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




    invalid_count = nrow(dataset) - as.numeric(codes$freq[which(codes$labels == "Valid Date")])


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
        invalid_count = invalid_count
      ) |>
      dplyr::rename(
        Start = start,
        End = end,
        Units = units,
        "Time Zone" = tzone
      ) |>

      dplyr::relocate(
        invalid_count,.before = Start
      ) |>
      dplyr::rename(
        "Invalid Count" = invalid_count
      )


  } else {

  # get the value labels to start off with
  codes = data.frame(
    value = sjlabelled::get_values(dataset[[varname]])
  )


  # search for invalid codes

 invalid_codes = chokmah::invalid_code_finder(
   variable = varname,
   dataset = dataset,
   meta_path = meta_path,
   write_meta = T
 )



  # attach the labels
  codes$label =  sjlabelled::get_labels(dataset[[varname]])


  # get the frequency count or each of the things
  codes$freq = table(dataset[[varname]])[match(codes$value,names(table(dataset[[varname]])))] |> as.numeric()




  # compute the percent for each frequency
  codes = codes  |>
    dplyr::mutate(
      percent = paste(round(freq/sum(freq,na.rm = T) * 100,1),"%",sep = "")
    )



  meta_data = readRDS(meta_path) |>
    dplyr::select(!starts_with("NA"))

  # pull the counts of the valid values, by ignoring those which are missing variable types
  invalid_value_states =  codes$value %in% invalid_codes

  codes$valid = ifelse(
    invalid_value_states,
    0,
    codes$freq
  )


  # count for the invalid codes
  count_valid = sum(codes$valid,na.rm = T)
  count_invalid = sum(codes$freq,na.rm = T) - count_valid



  # turn the valid counts into percentages
  codes = codes  |>
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
    dplyr::mutate(
      freq = paste0(freq," (",percent,")")
    ) |>
    dplyr::select(!percent) |>
    dplyr::rename(
      "Value" = value,
      Label = label,
      Frequency = freq,
      # "%" = percent,
      "Valid %" = valid
    )


  # if the var type is interval then remove the label column and rename label as the values
  if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "continuous"){

    codes = codes |>
      dplyr::select(!Value) |>
      dplyr::rename(Value = Label)

  }





  # prepare the summary metric tables
  if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "continuous"){


    # remove the non-valid data
    # note the danger with how this is treated for continuous values
    sum_data =   dataset[[varname]][!dataset[[varname]] %in% invalid_codes]


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



  } else if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "discrete"){

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

  }

  # sumtab_list = append(sumtab_list,list(sum_tab))

  return(
    list(
      value_table = codes,
      sum_table = sum_tab
    )
  )

}



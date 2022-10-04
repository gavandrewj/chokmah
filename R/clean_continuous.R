#' Clean Continuous Variable
#'
#' @param var a continuous variable that you want to check the distribution of.
#'
#' @return Returns how many missing, not applicable values along with what values stop the conversion to numeric. If the variable is able to be converted to a continuous form then returns a histogram plot as well.
#' @export
#'
#' @examples
#' clean_continuous(c(rnorm(500),NA,"Not Applicable"))
clean_continuous = function(var){

  # change the variable to lower case to check for not applicable
  var_label = sjlabelled::get_label(var)
  value_label = sjlabelled::get_labels(var)
  var = tolower(var)
  not_app =   which(var == 'not applicable')
  neg_three =   which(var == -3)
  neg_two =   which(var == -2)
  neg_one =   which(var == -1)

  # how many not applicable are there
  length_notapp = length(not_app)
  percent_notapp = round(length_notapp/length(var) * 100,2)

  length_neg_three = length(neg_three)
  percent_neg_three = round(length_neg_three/length(var) * 100,2)

  length_neg_two = length(neg_two)
  percent_neg_two = round(length_neg_two/length(var) * 100,2)

  length_neg_one = length(neg_one)
  percent_neg_one = round(length_neg_one/length(var) * 100,2)


  # how many missing values are there
  num_missing = sum(is.na(var))
  percent_missing = round(num_missing/length(var) * 100,2)

  var[not_app] = NA #replace all not applicable with NA



  # are there any offenders
  offenders = which(strex::str_can_be_numeric(var) == F)

  offenders_are_na =  sum(!is.na(var[offenders])) == 0




  if(purrr::is_empty(offenders) == T | offenders_are_na == T){

    data_set = data.frame(
      var = var
    )

    p =  rain_plot(
      dataset = data_set,
      varname = 'var',
      y_label = var_label
    ) +
      ggplot2::theme(
        axis.text.y =  ggplot2::element_blank(),
        axis.ticks.y =   ggplot2::element_blank()
      )


    message(paste0("There are ",num_missing," (",percent_missing,")% missing values",sep = " "))

    message(paste0("There are ",length_notapp," (",percent_notapp,")% not applicable values",sep = " "))

    message(paste0("There are ",length_neg_three," (",percent_neg_three,")% -3 values",sep = " "))

    message(paste0("There are ",length_neg_two," (",percent_neg_two,")% -2 values",sep = " "))

    message(paste0("There are ",length_neg_one," (",percent_neg_one,")% -1 values",sep = " "))

    message(paste0("Variable label: ",var_label,sep = " "))

    message(paste0("Value label ",value_label,sep = " "))

    return(p)


  } else {


    offenders_list =  var[offenders] |>
      na.omit() |>
      as.character()

    message(paste0("There are ",num_missing," (",percent_missing,")% missing values",sep = " "))

    message(paste0("There are ",length_notapp," (",percent_notapp,")% not applicable values",sep = " "))

    message(paste0("There are ",length_neg_three," (",percent_neg_three,")% -3 values",sep = " "))

    message(paste0("There are ",length_neg_two," (",percent_neg_two,")% -2 values",sep = " "))

    message(paste0("There are ",length_neg_one," (",percent_neg_one,")% -1 values",sep = " "))

    message("The following prevents a conversion to a continuous variable:")

    return(offenders_list)

  }



}

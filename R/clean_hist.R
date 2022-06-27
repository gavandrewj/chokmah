#' Cleaned Histogram
#'
#' @param var a continuous variable that you want to check the distribution of.
#'
#' @return A histogram plot or a list of values
#' @export
#'
#' @examples
clean_histogram = function(var){

  # change the variable to lower case to check for not applicable
  var_label = sjlabelled::get_label(var)
  var = tolower(var)
  not_app =   which(var == 'not applicable')

  # how many not appliable are there
  length_notapp = length(not_app)

  var[not_app] = NA #replace all not applicable with NA



  # are there any offenders
  offenders = which(strex::str_can_be_numeric(var) == F)

  offenders_are_na =  sum(!is.na(var[offenders])) == 0




  if(purrr::is_empty(offenders) == T | offenders_are_na == T){

    data_set = data.frame(
      var = var
    )

    p =  suppressMessages(rain_plot(
      dataset = data_set,
      varname = 'var',
      y_label = var_label
    ) +
      ggplot2::theme(
        axis.text.y =  ggplot2::element_blank(),
        axis.ticks.y =   ggplot2::element_blank()
      )
    )



    return(p)


  } else {


    offenders_list =  var[offenders] |>
      na.omit() |>
      as.character()


    message("The following prevents a conversion to a continuous variable:")

    return(offenders_list)

  }



}

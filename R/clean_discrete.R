#' Clean Discrete Variable
#'
#' @param var discrete variable
#'
#' @return bar chart showing all levels of discrete variable along with number of not applicable and missing values
#' @export
#'
#' @examples
#' clean_discrete(sample(c("a","b","c"),100,replace = T))
clean_discrete = function(var){


  # change the variable to lower case to check for not applicable
  var_label = sjlabelled::get_label(var)
  var_vallabels = sjlabelled::get_labels(var)

  # var = tolower(var)
  not_app =   which(tolower(var) == 'not applicable')

  # how many not appliable are there
  length_notapp = length(not_app)
  percent_notapp = round(length_notapp/length(var) * 100,2)


  # how many missing values are there
  num_missing = sum(is.na(var))
  percent_missing = round(num_missing/length(var) * 100,2)

  var[not_app] = NA #replace all not applicable with NA


  data_set = data.frame(
    variable = var
  )

  p =  data_set |>
    dplyr::filter(
      variable != 'not applicable'
    ) |>
    na.omit() |>
    ggplot2::ggplot(
      ggplot2::aes(variable)
    ) +
    ggplot2::geom_bar() +
    ggplot2::labs(
      x = var_label
    ) +
    ggpubr::theme_pubr() +
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(angle = 45)
    )


  message(paste0("There are ",num_missing," (",percent_missing,")% missing values",sep = " "))

  message(paste0("There are ",length_notapp," (",percent_notapp,")% not applicable values",sep = " "))

  message(paste0("Variable label: ",var_label,sep = " "))


  return(
    list(
      p,
      table(var),
      var_vallabels
      )

  )
}

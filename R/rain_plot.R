#' Rain Plot
#'
#' @param dataset dataset
#' @param varname outcome variable
#' @param groupvar grouping variable
#' @param facetvar facet variable
#' @param title title for the plot
#' @param y_label label for y axis
#' @param x_label label for x axis
#' @param leg.title label for the legend
#' @param flip TRUE or FALSE flip the x and y axis
#' @param notes add notes as a caption at the bottom
#' @param wrap_count make the text for the caption fit better
#' @param alpha_val control the visibility for the points
#' @param boxplot TRUE or FALSE; add
#' @param ncols number of columns for the facet
#' @param color_point_var what colour should the points be
#'
#' @return a rain plot
#' @export
#'
#' @examples
#' rain_plot(dataset = data.frame(yvar = rnorm(100)),varname = "yvar")
rain_plot = function(
    dataset,
    varname,
    groupvar = NULL,
    facetvar = NULL,
    title = '',
    y_label = NULL,
    x_label = NULL,
    leg.title = '',
    flip = T,
    notes = '',
    wrap_count = 87,
    alpha_val = 0.3,
    boxplot = T,
    ncols = 1,
    color_point_var = NULL

){

  if(purrr::is_empty(y_label)){
y_label = sjlabelled::get_label(dataset[[varname]])
}


  # if(purrr::is_empty(x_label)){
  #   x_label = sjlabelled::get_label(dataset[[groupvar]])
  # }


  # filter to get the data you need
  dataset = dataset |>
    dplyr::select(
      varname, groupvar,facetvar
    ) |>
    tidyr::drop_na()  |>
    dplyr::mutate(
      dplyr::across(
        .cols = varname,
        .fns = as.numeric
      )
    )



  # perform action depending on whether you have a grouping variable or not

  if(purrr::is_empty(groupvar)){

    plot = dataset |>
      ggplot2::ggplot(
        ggplot2::aes(x = factor(1), y = .data[[varname]])
      ) +
      ggdist::stat_halfeye(
        adjust = .5,
        width = .6,
        .width = 0,
        justification = -.3,
        point_colour = NA,
      )

    if(boxplot){
      plot = plot + ggplot2::geom_boxplot(
        width = .25,
        outlier.shape = NA
      )
    }

    plot = plot +
      ggplot2::geom_point(
        size = 2,
        alpha = alpha_val,
        color = 'black',
        position = ggplot2::position_jitter(
          seed = 1, width = .1
        )
      ) +
      ggplot2::coord_cartesian(xlim = c(1.2, NA), clip = "off")

  } else {

    plot =  dataset |>
      ggplot2::ggplot(
        ggplot2::aes(x = .data[[groupvar]], y = .data[[varname]])
      ) +
      ggdist::stat_halfeye(
        adjust = .5,
        width = .6,
        .width = 0,
        justification = -.3,
        point_colour = NA,
        ggplot2::aes(fill = .data[[groupvar]])
        # breaks = num_breaks
      )

    if(boxplot){
      plot = plot + ggplot2::geom_boxplot(
        width = .25,
        outlier.shape = NA
      )
    }


    plot = plot +
      {if(purrr::is_empty(color_point_var) == F) ggplot2::geom_point(
        size = 2,alpha = alpha_val,ggplot2::aes(color = .data[[color_point_var]]),
        position = ggplot2::position_jitter(seed = 1, width = .1)
      )}+

      {if(purrr::is_empty(color_point_var)) ggplot2::geom_point(
        size = 2,alpha = alpha_val,color = 'black',
        position = ggplot2::position_jitter(seed = 1, width = .1)
      )}+

      ggplot2::coord_cartesian(xlim = c(1.2, NA), clip = "off")

  }


  # switch the x and y axis
  if(flip){
    plot = suppressMessages(plot + ggplot2::coord_flip())
  }


  # apply a facet variable
  if(!purrr::is_empty(facetvar)){
    plot = plot + ggplot2::facet_wrap(~ .data[[facetvar]],
                             scales = 'free',
                             ncol = ncols)
  }


  # apply some ggplot2::theme aspect from ggpubr package
  plot = plot +
    ggpubr::theme_pubr() +
    ggplot2::labs(
      y = y_label,
      x = x_label,
      title = title,
      caption = stringr::str_wrap(notes,wrap_count)
    ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5,size = 16),
      axis.ticks.x = ggplot2::element_blank(),
      legend.position = 'none',
      plot.caption = ggplot2::element_text(hjust = 0,size = 12)
    )


  return(plot)

}

#' Title
#'
#' @param dataset
#' @param yvar
#' @param groupvar
#' @param x_label
#' @param y_label
#'
#' @return
#' @export
#'
#' @examples
anova_graph = function(
    dataset,
    yvar,
    groupvar,
    x_label = NULL,
    y_label = NULL
    ){




  graph = ggpubr::ggviolin(
    dataset,
    x = groupvar,
    y = yvar,
    fill = groupvar,
    add = c('boxplot',"jitter"),
    add.params = list(fill = "white")) +
    # stat_compare_means(comparisons = my_comparisons, label = "p.signif")  + # Add significance levels

    ggplot2::scale_x_discrete(
      labels = scales::label_wrap(15)
      ) +
    ggplot2::labs(
      x = x_label,
      y = y_label,
      fill = x_label
    ) +
    ggplot2::theme(
      # axis.text.x = ggplot2::element_text(angle = 45)
    )



  return(graph)



}

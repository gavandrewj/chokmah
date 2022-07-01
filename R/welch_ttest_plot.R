#' Title
#'
#' @param dataset
#' @param yvar
#' @param groupvar
#' @param legend.title
#' @param y_label
#' @param x_label
#'
#' @return
#' @export
#'
#' @examples
welch_graph = function(
    dataset,
    yvar,
    groupvar,
    legend.title,
    y_label = "Frequency",
    x_label = NULL
    ){



  graph =   ggpubr::gghistogram(
    dataset,
    x = yvar,
    add = "median", rug = TRUE,
    color = groupvar, fill = groupvar,
    palette = c("#00AFBB", "#E7B800"),
    ylab = y_label,
    xlab = x_label
  ) |>
    ggpubr::ggpar(
      legend.title = legend.title
    )

  return(graph)

}

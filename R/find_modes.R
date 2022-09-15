#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
find_modes <- function(x) {

  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]

}

#' Title
#'
#' @param x
#' @param weights
#' @param na.rm
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
odds_denominator <- function(x, weights=rep(1,length(x)), na.rm = T, ...){

  if (any(ina <- is.na(x))) {
    if (na.rm)
      x <- x[!ina]
    else return(NA)
  }




  odds_data =   x |> table() |> data.frame()



 odds_data[which(odds_data$x == 0),'Freq']





}

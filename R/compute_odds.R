compute_odds <- function(x, weights=rep(1,length(x)), na.rm = T, ...){

  if (any(ina <- is.na(x))) {
    if (na.rm)
      x <- x[!ina]
    else return(NA)
  }




  odds_data =   x |> table() |> data.frame()

  odds_numerator =   odds_data[which(odds_data$x == 1),'Freq']

  odds_denominator = odds_data[which(odds_data$x == 0),'Freq']

  odds_numerator/odds_denominator



}

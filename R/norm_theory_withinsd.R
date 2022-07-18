#' Title
#'
#' @param x a continuous variable
#'
#' @return
#' @export
#'
#' @examples
norm_theory_withinsd = function(x){

  # remove missing values
  x = x[!is.na(x)]


  # find the percentage of points that are within one standard deviation of the mean
  crit_one =   abs(x - mean(x)) < sd(x)
  within_one_sd = round(length(which(crit_one == T))/length(x) * 100,1)


  # find the percentage of points that are within two standard deviations of the mean
  crit_two =   abs(x - mean(x)) < sd(x) * 2
  within_two_sd = round(length(which(crit_two == T))/length(x) * 100,1)


  # output the messages
  message(paste0(within_one_sd,'% of data points within one sd of the mean'))
  message(paste0(within_two_sd,'% of data points within two sd of the mean'))

}

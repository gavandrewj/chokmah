#' Title
#'
#' @param variable
#' @param regression
#' @param estimate_name
#' @param chart
#' @param patient_group
#' @param categorical
#' @param cat_level
#' @param cat_varname
#' @param point_est_state
#' @param lowerb_state
#' @param upperb_state
#' @param cat_binary
#'
#' @return
#' @export
#'
#' @examples
logistic_interpret_baseline = function(
    variable,
    regression,
    estimate_name,
    chart,
    patient_group,
    categorical = F,
    cat_level = NULL,
    cat_varname = NULL,
    point_est_state = NULL,
    lowerb_state = NULL,
    upperb_state = NULL,
    cat_binary = T
){

  if(categorical == F){

    cat('The baseline group for comparison of the estimates for ',variable,' is ',patient_group, ', for which the estimate is ',
        gtsummary::inline_text(get(regression)$gt_table,variable = estimate_name),
        '. The point estimate (',
        get(regression)$point_estimate[[estimate_name]],
        ') indicates an associated multiplicative ',ifelse(get(regression)$point_estimate[[estimate_name]]  > 1,'increase','decrease'),' in the odds of a failure by ',
        get(regression)$point_estimate[[estimate_name]],
        ' for every one-unit increase in ',variable,' (see Figure \\@ref(fig:',chart,')). The lower bound (',
        get(regression)$lower[[estimate_name]],
        ') indicates an associated multiplicative ',ifelse(get(regression)$lower[[estimate_name]]  > 1,'increase','decrease'),' in the odds of a failure by ',
        get(regression)$lower[[estimate_name]],
        ' for every one-unit increase in ',variable,'. The upper bound (',
        get(regression)$upper[[estimate_name]],
        ') indicates an associated multiplicative ',ifelse(get(regression)$upper[[estimate_name]]  > 1,'increase','decrease'),' in the odds of failure by ',
        get(regression)$upper[[estimate_name]],
        ' for every one-unit increase in ',variable,'.',
        if(get(regression)$lower[[estimate_name]] < 1 & get(regression)$upper[[estimate_name]] > 1){
          paste(" The possible range of the odds multipliers indicates that the association may be in either direction or there may be no change in the odds of failure associated with",variable,"(due to odds multiplier = 1).",sep = ' ')} else {""},sep = '')


  } else if(cat_binary == T){

    cat('The baseline group for comparison of the estimate for ',variable,' is ',patient_group, ', for which the odds are ',
        get(regression)$point_estimate[[estimate_name]],point_est_state,'.',
        sep = ''
    )



  } else {

    cat('The baseline group for comparison of the estimates for ',variable,' is ',patient_group, ', for which the estimate is ',
        gtsummary::inline_text(get(regression)$gt_table,variable = cat_varname,level = cat_level),
        '. The point estimate (',
        get(regression)$point_estimate[[estimate_name]],
        ') indicates an associated multiplicative ',ifelse(get(regression)$point_estimate[[estimate_name]]  > 1,'increase','decrease'),' in the odds of a failure by ',
        get(regression)$point_estimate[[estimate_name]],
        point_est_state,' The lower bound (',
        get(regression)$lower[[estimate_name]],
        ') indicates an associated multiplicative ',ifelse(get(regression)$lower[[estimate_name]]  > 1,'increase','decrease'),' in the odds of a failure by ',
        get(regression)$lower[[estimate_name]],
        lowerb_state,' The upper bound (',
        get(regression)$upper[[estimate_name]],
        ') indicates an associated multiplicative ',ifelse(get(regression)$upper[[estimate_name]]  > 1,'increase','decrease'),' in the odds of failure by ',
        get(regression)$upper[[estimate_name]],
        upperb_state,
        if(get(regression)$lower[[estimate_name]] < 1 & get(regression)$upper[[estimate_name]] > 1){
          paste(" The possible range of the odds multipliers indicates that the association may be in either direction or there may be no change in the odds of failure associated with",variable,"(due to odds multiplier = 1).",sep = ' ')} else {""},sep = '')

  }

}

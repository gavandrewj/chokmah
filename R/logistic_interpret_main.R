#' Title
#'
#' @param variable
#' @param regression
#' @param reg_var
#' @param reg_level
#' @param estimate_name
#' @param varname_baseline
#' @param chart
#' @param patients_group
#' @param baseline
#' @param digits
#' @param categorical
#' @param cat_binary
#' @param cat_level
#' @param cat_varname
#' @param point_est_state
#' @param lowerb_state
#' @param upperb_state
#' @param conclude_state
#' @param benchmark_odds how far away from one to then consider the odds ratio different from one
#'
#' @return
#' @export
#'
#' @examples
logistic_interpret_main = function(
    variable ,
    regression,
    reg_var = NULL,
    reg_level = NULL,
    estimate_name ,
    varname_baseline,
    chart = NULL,
    patients_group,
    baseline = '',
    digits = 3,
    categorical = F,
    cat_binary = F,
    cat_level = NULL,
    cat_varname = NULL,
    point_est_state = NULL,
    lowerb_state = NULL,
    upperb_state = NULL,
    conclude_state = NULL,
    benchmark_odds = 0.05){



  if(categorical == F){

    interpretation =  cat(
      'The estimate for the relationship between ',patients_group,' compared to ',baseline,' for changes in ',variable,' is ',
      gtsummary::inline_text(get(regression)$gt_table,variable = reg_var,level = reg_level),
      '. The point estimate (',
      get(regression)$point_estimate[[estimate_name]],
      ') indicates an associated multiplicative ',ifelse(get(regression)$point_estimate[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1,'increase','decrease'),' in the odds of failure by ',
      round(get(regression)$point_estimate[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      ' for every one-unit increase in ',variable,' ',point_est_state,' (see Figure \\@ref(fig:',chart,')). The lower bound (',
      get(regression)$lower[[estimate_name]],
      ') indicates an associated multiplicative ',ifelse(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1,'increase','decrease'),' in the odds of failure by ',
      round(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      ' for every one-unit increase in ',variable,' ',lowerb_state, '. The upper bound (',
      get(regression)$upper[[estimate_name]],
      ') indicates an associated multiplicative ',ifelse(get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1,'increase','decrease'),' in the odds of failure by ',
      round(get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      ' for every one-unit increase in ',variable,' ',lowerb_state,'.',
      if(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] < 1 & get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1){
        paste(" The possible range of the odds multipliers indicates that the association may be in either direction or there may be no change in the odds of failure associated with",variable,"(due to odds multiplier = 1).",sep = ' ')} else {""},sep = '')


  } else if(cat_binary == T){

    interpretation =  cat(
      'The estimate comparing ',patients_group,' to ',baseline,' is ',
      gtsummary::inline_text(get(regression)$gt_table,variable = cat_varname,level = cat_level),
      '. The point estimate (',
      get(regression)$point_estimate[[estimate_name]],
      ') indicates ',
      if(get(regression)$point_estimate[[estimate_name]]  == 1){'no change'} else if(abs(get(regression)$point_estimate[[estimate_name]] - 1) < benchmark_odds){'almost no change'} else if(get(regression)$point_estimate[[estimate_name]]  > 1){'a multiplicative increase'} else if(get(regression)$point_estimate[[estimate_name]]  < 1){'a multiplicative decrease'},
      ' in the odds that ',point_est_state,
      if(get(regression)$point_estimate[[estimate_name]]  == 1){'.'} else if(abs(get(regression)$point_estimate[[estimate_name]] - 1) < benchmark_odds){paste0(' (updated odds = ',round(get(regression)$point_estimate[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),')')} else {paste0(' by ',round(get(regression)$point_estimate[[estimate_name]],digits),' (updated odds = ',round(get(regression)$point_estimate[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),')')},
      '. The lower bound (',
      get(regression)$lower[[estimate_name]],
      ') indicates a multiplicative ',
      ifelse(get(regression)$lower[[estimate_name]]  > 1,'increase','decrease'),
      ' in the odds ',lowerb_state,' by ',
      round(get(regression)$lower[[estimate_name]],digits),
      ' (updated odds = ',
      round(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      ')',
      '. The upper bound (',
      get(regression)$upper[[estimate_name]],
      ') indicates a multiplicative ',
      ifelse(get(regression)$upper[[estimate_name]]  > 1,'increase','decrease'),
      ' in the odds that ',upperb_state,' by ',
      round(get(regression)$upper[[estimate_name]],digits),
      ' (updated odds = ',
      round(get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      ').',
      if(get(regression)$lower[[estimate_name]]  < 1 & get(regression)$upper[[estimate_name]]  > 1){
        paste(" The possible range of the odds multiplier indicates that the association may be in either direction or there may be no change in the odds of failure associated with",variable,"(due to odds multiplier = 1).",sep = ' ')} else {""},
      conclude_state,
      sep = ''
    )



  } else {

    interpretation =  cat(
      'The estimate for the relationship between ',patients_group,' and those ',baseline,' for ',variable,' is ',
      gtsummary::inline_text(get(regression)$gt_table,variable = cat_varname,level = cat_level),
      '. The point estimate (',
      get(regression)$point_estimate[[estimate_name]],
      ') indicates an associated multiplicative ',ifelse(get(regression)$point_estimate[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1,'increase','decrease'),' in the odds of failure by ',
      round(get(regression)$point_estimate[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      point_est_state,' The lower bound (',
      get(regression)$lower[[estimate_name]],
      ') indicates an associated multiplicative ',ifelse(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1,'increase','decrease'),' in the odds of failure by ',
      round(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      lowerb_state,' The upper bound (',
      get(regression)$upper[[estimate_name]],
      ') indicates an associated multiplicative ',ifelse(get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1,'increase','decrease'),' in the odds of failure by ',
      round(get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]],digits),
      upperb_state,
      if(get(regression)$lower[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] < 1 & get(regression)$upper[[estimate_name]] * get(regression)$point_estimate[[varname_baseline]] > 1){
        paste(" The possible range of the odds multiplier indicates that the association may be in either direction or there may be no change in the odds of failure associated with",variable,"(due to odds multiplier = 1).",sep = ' ')} else {""},sep = '')




  }

  return(interpretation)

}


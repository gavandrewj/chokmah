#' Title
#'
#' @param dataset
#' @param yvar
#' @param groupvar
#' @param load_tab
#' @param tab_name
#' @param file_path
#' @param caption
#'
#' @return
#' @export
#'
#' @examples
fishers_exact_result_table = function(
    dataset,
    yvar,
    groupvar,
    load_tab = F,
    tab_name,
    file_path,
    caption = ""
    ){

  gtsummary::theme_gtsummary_compact(T,font_size = 12)

  # function to compute fishers exact table
  or_fun <- function(data, variable, by, ...) {
    table(data[[by]], data[[variable]]) |>
      fisher.test() |>
      broom::tidy() |>
      mutate(
        method = "Fisher's Exact Test"
      )
  }

  source("./R/odds_numerator.R")
  source("./R/odds_denominator.R")
  source("./R/compute_odds.R")

  # or_fun(trial, "trt", "response")

  if(load_tab){

    fish_tab =  readRDS(paste0(file_path,"fishtab_",tab_name,".rda"))


  } else {

    fish_tab = dataset |>
    dplyr::select(
      yvar,
      groupvar
      ) |>
    gtsummary::tbl_summary(
      by = groupvar,
      digits = yvar ~ c(0,0,2),
      type = list(yvar ~ 'continuous'),
      missing = "no",
      statistic = list(
      yvar ~ "{odds_numerator} / {odds_denominator} ({compute_odds})")
      ) |>
    gtsummary::add_difference(
      test = yvar ~ or_fun,
      estimate_fun = yvar ~ gtsummary::style_ratio) |>
    gtsummary::modify_header(estimate ~ "**Odds Ratio**") |>
    gtsummary::modify_header(label = paste0("**","","**")) |>
    gtsummary::modify_footnote(update = c(stat_1,stat_2) ~ "Odds") |>
    gtsummary::modify_caption(caption) |>
    gtsummary::as_flex_table()


    saveRDS(fish_tab, paste0(file_path,"fishtab_",tab_name,".rda"))


  }

  return(fish_tab)
}

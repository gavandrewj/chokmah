#' Title
#'
#' @param dataset
#' @param yvar
#' @param groupvar
#' @param load_tab
#' @param tab_name
#' @param caption
#' @param file_path
#'
#' @return
#' @export
#'
#' @examples
welch_ttest_table = function(
    dataset,
    yvar,
    groupvar,
    load_tab = F,
    tab_name,
    caption = NULL,
    file_path
){



  if(load_tab == F){

    welch_tab =  dataset |>
      dplyr::select(
        yvar,
        groupvar
      ) |>
      gtsummary::tbl_summary(
        by = groupvar,
        type = list(yvar ~"continuous2"),
        statistic =
          list(
            gtsummary::all_continuous() ~ c(
              "{mean} ({sd})",
              "{median} ({p25}, {p75})"
            )
          )
      ) |>
      gtsummary::add_difference() |>
      gtsummary::modify_header(label = paste0("**","","**")) |>
      gtsummary::as_flex_table() |>
      flextable::set_caption(caption)


    saveRDS(welch_tab,paste0(file_path,"welch_",tab_name,".rda"))

  } else {

    welch_tab = readRDS(paste0(file_path,"welch_",tab_name,".rda"))


  }




  return(welch_tab)

}


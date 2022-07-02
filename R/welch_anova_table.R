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
welch_anova_table = function(
    dataset,
    yvar,
    groupvar,
    load_tab = F,
    tab_name,
    caption = NULL,
    file_path
){



  if(load_tab == F){

      welch_anova <- function(data, variable, by, ...) {
        gtsummary::style_pvalue(
          rstatix::welch_anova_test(
            data = data,
            data[[variable]] ~ as.factor(data[[by]]))$p,
          digits = 2)
        }


welch_anova_tab =
    dataset |>

      dplyr::select(yvar,groupvar) |>

      gtsummary::tbl_summary(
        by = groupvar,
        missing = "no",
        type = yvar ~ "continuous2",
        statistic = yvar ~ c("{mean} ({sd})", "{median} ({p25}, {p75})")
        ) |>

  gtsummary::add_stat(fns = yvar ~ welch_anova) |>

  gtsummary::modify_header(
        list(
          add_stat_1 ~ "**p-value**"
        )
      ) |>

  gtsummary::modify_header(label = paste0("**","","**")) |>

  gtsummary::modify_caption(caption)  |>

  gtsummary::as_flex_table() |>

      flextable::footnote( i = 1, j = 5,
                value = flextable::as_paragraph(
                  c("Welch's Anova Test")
                ),
                ref_symbols = c("1"),
                part = "header")

    saveRDS(welch_anova_tab,paste0(file_path,"welch_anova",tab_name,".rda"))

  } else {

    welch_anova_tab = readRDS(paste0(file_path,"welch_anova",tab_name,".rda"))


  }




  return(welch_anova_tab)

}


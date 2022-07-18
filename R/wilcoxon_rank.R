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
wilcox_rank = function(
    dataset,
    yvar,
    groupvar,
    load_tab = F,
    tab_name,
    file_path,
    caption = "",
    outcome_vartype = "categorical"
){


  # function to compute the cles
  cles_fun <- function(data, variable, by, ...) {

    cs_data = data |>
      dplyr::mutate(
        dplyr::across(
          .cols = variable,
          .fns = as.numeric
        )
      )

    effectsize::cles(
      data = cs_data,
      x = arsenal::formulize(x = by,y = variable)
    ) |>
      dplyr::as_tibble() |>
      dplyr::filter(Parameter == "Pr(superiority)") |>
      dplyr::select(
        Coefficient,CI_low,CI_high
      ) |>
      dplyr::mutate(
        dplyr::across(
          .cols =  dplyr::everything(),
          .fns = ~gtsummary::style_number(.x,digits = 2)
        )
      ) |>
      dplyr::mutate(
        ci = paste0(CI_low,',',CI_high)
      ) |>
      dplyr::select(
        Coefficient,ci
      ) |>
      dplyr::rename(
        CLES = Coefficient,
        "95% CI" = ci
      )

  }



  # or_fun(trial, "trt", "response")

  if(load_tab){

    wilcox_tab =  readRDS(paste0(file_path,"wilcoxtab_",tab_name,".rda"))


  } else {

    if(outcome_vartype == "categorical"){

    wilcox_tab = dataset |>
      dplyr::select(
        yvar,
        groupvar
      ) |>
      gtsummary::tbl_summary(
        by = groupvar
      ) |>
      gtsummary::add_stat(
        yvar ~ cles_fun
      ) |>
      gtsummary::add_p(
        test = yvar ~ wilcox.test
      ) |>
      gtsummary::modify_header(label = "") |>
      gtsummary::modify_footnote(everything() ~ NA) |>
      gtsummary::modify_caption(caption) |>
      gtsummary::as_flex_table() |>
      flextable::footnote(
        i = 1,j = c(2,3),
        value = flextable::as_paragraph(c("n (%)")),
        ref_symbols = c("1"),
        part = "head"
      ) |>
      flextable::footnote(
        i = 1,j = c(4,5),
        value = flextable::as_paragraph(c("Common Language Effect Size")),
        ref_symbols = c("2"),
        part = "head"
      ) |>
      flextable::footnote(
        i = 1,j = c(5),
        value = flextable::as_paragraph(c("Confidence Interval")),
        ref_symbols = c("3"),
        part = "head"
      ) |>
      flextable::footnote(
        i = 1,j = c(6),
        value = flextable::as_paragraph(c("Wilcoxon Rank Sum Test")),
        ref_symbols = c("4"),
        part = "head"
      )
    } else if(outcome_vartype == "continuous"){

      wilcox_tab = dataset |>
        dplyr::select(
          yvar,
          groupvar
        ) |>
        gtsummary::tbl_summary(
          by = groupvar,
          type = list(
            gtsummary::all_continuous() ~ 'continuous2',
            yvar ~ "continuous2"
          ),
          statistic = list(
            gtsummary::all_continuous2() ~ c(
              "{median} ({p25}, {p75})",
              "{min}, {max}"
            )

          )
        ) |>
        gtsummary::add_stat(
          yvar ~ cles_fun
        ) |>
        gtsummary::add_p(
          test = yvar ~ wilcox.test
        ) |>
        gtsummary::modify_header(label = "") |>
        gtsummary::modify_footnote(everything() ~ NA) |>
        gtsummary::modify_caption(caption) |>
        gtsummary::as_flex_table() |>
        flextable::footnote(
          i = 1,j = c(2,3),
          value = flextable::as_paragraph(c("n (%)")),
          ref_symbols = c("1"),
          part = "head"
        ) |>
        flextable::footnote(
          i = 1,j = c(4,5),
          value = flextable::as_paragraph(c("Common Language Effect Size")),
          ref_symbols = c("2"),
          part = "head"
        ) |>
        flextable::footnote(
          i = 1,j = c(5),
          value = flextable::as_paragraph(c("Confidence Interval")),
          ref_symbols = c("3"),
          part = "head"
        ) |>
        flextable::footnote(
          i = 1,j = c(6),
          value = flextable::as_paragraph(c("Wilcoxon Rank Sum Test")),
          ref_symbols = c("4"),
          part = "head"
        )

}


    saveRDS(wilcox_tab, paste0(file_path,"wilcoxtab_",tab_name,".rda"))


  }

  return(wilcox_tab)
}

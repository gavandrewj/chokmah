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
kruskal_wal = function(
    dataset,
    yvar,
    groupvar,
    load_tab = F,
    tab_name,
    file_path,
    caption = "",
    outcome_vartype = "categorical"
){

  gtsummary::theme_gtsummary_compact(T,font_size = 12)

  # function to compute the cles
  # eps_fun <- function(data, variable, by, ...) {
  #
  #   esp_data = data |>
  #     dplyr::mutate(
  #       dplyr::across(
  #         .cols = variable,
  #         .fns = as.numeric
  #       )
  #     )
  #
  #   effectsize::rank_epsilon_squared(
  #     data = esp_data,
  #     x = arsenal::formulize(x = by,y = variable)
  #   ) |>
  #     dplyr::as_tibble() |>
  #     dplyr::select(
  #       rank_epsilon_squared,CI_low,CI_high
  #     ) |>
  #     dplyr::mutate(
  #       dplyr::across(
  #         .cols =  dplyr::everything(),
  #         .fns = ~gtsummary::style_number(.x,digits = 2)
  #       )
  #     ) |>
  #     dplyr::mutate(
  #       ci = paste0(CI_low,',',CI_high)
  #     ) |>
  #     dplyr::select(
  #       rank_epsilon_squared,ci
  #     ) |>
  #     dplyr::rename(
  #       Epsilon = rank_epsilon_squared,
  #       "95% CI" = ci
  #     )
  #
  # }



  # or_fun(trial, "trt", "response")

  if(load_tab){

    krus_tab =  readRDS(paste0(file_path,"krustab_",tab_name,".rda"))


  } else {

    if(outcome_vartype == "categorical"){

    krus_tab = dataset |>
      dplyr::select(
        yvar,
        groupvar
      ) |>
      gtsummary::tbl_summary(
        by = groupvar
      ) |>
      # gtsummary::add_stat(
      #   yvar ~ eps_fun
      # ) |>
      gtsummary::add_p(
        test = yvar ~ kruskal.test
      ) |>
      gtsummary::modify_header(label = "") |>
      gtsummary::modify_footnote(everything() ~ NA) |>
      gtsummary::modify_caption(caption) |>
      gtsummary::as_flex_table()
    # |>
    #   flextable::footnote(
    #     i = 1,j = c(2,3),
    #     value = flextable::as_paragraph(c("n (%)")),
    #     ref_symbols = c("1"),
    #     part = "head"
    #   ) |>
    #   flextable::footnote(
    #     i = 1,j = c(4,5),
    #     value = flextable::as_paragraph(c("Rank Epsilon Squared")),
    #     ref_symbols = c("2"),
    #     part = "head"
    #   ) |>
    #   flextable::footnote(
    #     i = 1,j = c(5),
    #     value = flextable::as_paragraph(c("Confidence Interval")),
    #     ref_symbols = c("3"),
    #     part = "head"
    #   ) |>
    #   flextable::footnote(
    #     i = 1,j = c(6),
    #     value = flextable::as_paragraph(c("Kruskal-Wallis Test")),
    #     ref_symbols = c("4"),
    #     part = "head"
    #   )

    } else if(outcome_vartype == "continuous") {

      krus_tab = dataset |>
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
        # gtsummary::add_stat(
        #   yvar ~ eps_fun
        # ) |>
        gtsummary::add_p(
          test = yvar ~ kruskal.test
        ) |>
        gtsummary::modify_header(label = "") |>
        gtsummary::modify_footnote(everything() ~ NA) |>
        gtsummary::modify_caption(caption) |>
        gtsummary::as_flex_table()




    }


    saveRDS(krus_tab, paste0(file_path,"krustab_",tab_name,".rda"))


  }

  return(krus_tab)
}

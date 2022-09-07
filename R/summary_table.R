#' Summary Table
#'
#' @param dataset
#' @param sumvar variables to summarize
#' @param groupvar grouping variable
#' @param tab_name name to save the table as
#' @param load_tab should you load an already saved table; T or F
#' @param stratavar strata variable
#' @param caption
#' @param label_name
#' @param notes notes to put in the footer
#' @param digits
#' @param sumvar_type continuous2 or categorical
#' @param file_path provide the location to store the table
#' @param sort
#'
#' @return currently a table in word format
#' @export
#'
#' @examples
summary_tab = function(
    dataset,
    sumvar,
    groupvar = NULL,
    tab_name,
    load_tab = F,
    stratavar = NULL,
    caption = "",
    label_name = '',
    notes = '',
    digits = 1,
    sumvar_type = 'continuous2',
    file_path,
    sort = NULL,
    percent = 'column'
){


  gtsummary::theme_gtsummary_compact(T,font_size = 12)
  # source('C:/Users/gavin/Documents/GitHub/citadel/scripts/skewness.R')
  # source('C:/Users/gavin/Documents/GitHub/citadel/scripts/kurtosis.R')


  if(load_tab){

    sum_tab =  readRDS(paste0(file_path,"sumtab_",tab_name,".rda"))


  } else {


    if(purrr::is_empty(stratavar) & purrr::is_empty(groupvar)) {

      row_label = sjlabelled::get_label(dataset[[sumvar]])


      # dataset_filter = dataset |>
      #   dplyr::select(sumvar,groupvar) |>
      #   dplyr::filter(
      #     .data[[sumvar]] != 'Not Applicable' | is.na(.data[[sumvar]]))

      # sjlabelled::set_label(dataset_filter[[sumvar]]) = row_label



    } else if(purrr::is_empty(stratavar)){

      row_label = sjlabelled::get_label(dataset[[sumvar]])
      col_label = sjlabelled::get_label(dataset[[groupvar]])


      # dataset_filter = dataset |>
      #   dplyr::select(sumvar,groupvar) |>
      #   dplyr::filter(.data[[sumvar]] != 'Not Applicable',
      #                 .data[[groupvar]] != 'Not Applicable') |>
      #   dplyr::mutate(
      #     dplyr::across(
      #       .cols = c(groupvar),
      #       .fns = factor
      #     )
      #   )

      # sjlabelled::set_label(dataset_filter[[sumvar]]) = row_label
      # sjlabelled::set_label(dataset_filter[[groupvar]]) = col_label

    } else {

      sumvar_label = sjlabelled::get_label(dataset[[sumvar]])
      strata_label = sjlabelled::get_label(dataset[[stratavar]])
      col_label = sjlabelled::get_label(dataset[[groupvar]])


      # dataset_filter = dataset |>
      #   dplyr::select(sumvar,groupvar,stratavar) |>
      #   dplyr::filter(.data[[sumvar]] != 'Not Applicable',
      #                 .data[[groupvar]] != 'Not Applicable',
      #                 .data[[stratavar]] != 'Not Applicable') |>
      #   dplyr::mutate(
      #     dplyr::across(
      #       .cols = c(groupvar,stratavar),
      #       .fns = factor
      #     )
      #   ) |>
      #   dplyr::mutate(
      #     dplyr::across(
      #       .cols = c(sumvar),
      #       .fns = as.numeric
      #     )
      #   )
      #
      # sjlabelled::set_label(dataset_filter[[stratavar]]) = strata_label
      # sjlabelled::set_label(dataset_filter[[groupvar]]) = col_label
      # sjlabelled::set_label(dataset_filter[[sumvar]]) = sumvar_label

    }



    # make the tables

    if(purrr::is_empty(stratavar) & purrr::is_empty(groupvar)){



      sum_tab =  dataset |>
        dplyr::select(.data[[sumvar]])

      if(sumvar_type == 'categorical'){

        sum_tab[[sumvar]] = sum_tab[[sumvar]] |> forcats::fct_explicit_na(na_level = "Unknown") |>  sjlabelled::set_label(row_label)
      }

      sum_tab = sum_tab |>
        gtsummary::tbl_summary(
          missing = "no",
          sort = sort,
          percent = percent,


          type = list(
            gtsummary::all_continuous() ~ 'continuous2',
            sumvar ~ sumvar_type
          ),
          statistic = list(
            gtsummary::all_continuous2() ~ c(
              "{median} ({p25}, {p75})",
              "{min}, {max}"
              )


            # type = list(sumvar ~ 'continuous')
          ),

          digits = list(gtsummary::all_continuous2() ~ digits)

        ) |>

        gtsummary::modify_caption(
          caption = caption
        ) |>

        gtsummary::modify_header(label = paste0("**",label_name,"**")) |>

        gtsummary::as_flex_table() |>

        flextable::add_footer_lines(
          notes
        )


      saveRDS(sum_tab, paste0(file_path,"sumtab_",tab_name,".rda"))



    } else if(purrr::is_empty(stratavar)){






      sum_tab =  dataset |>
        dplyr::select(.data[[sumvar]],.data[[groupvar]] ) |>
        gtsummary::tbl_summary(
          by = .data[[groupvar]],
          missing = "no",
          percent = percent,


          type = list(
            gtsummary::all_continuous() ~ 'continuous2',
            sumvar ~ sumvar_type
          ),
          statistic = list(
            gtsummary::all_continuous2() ~ c(
              "{median} ({p25}, {p75})",
              "{min}, {max}"
              )


            # type = list(sumvar ~ 'continuous')
          ),

          digits = list(gtsummary::all_continuous2() ~ digits)

        ) |>

        gtsummary::modify_caption(
          caption = caption
        ) |>

        gtsummary::modify_header(label = paste0("**",label_name,"**")) |>

        gtsummary::as_flex_table() |>

        flextable::add_footer_lines(
          notes
        )




      saveRDS(sum_tab, paste0(file_path,"sumtab_",tab_name,".rda"))




    } else {


      sum_tab =  dataset |>
        dplyr::select(.data[[sumvar]], .data[[stratavar]],.data[[groupvar]] ) |>
        gtsummary::tbl_strata(
          strata = .data[[stratavar]],
          .tbl_fun =
            ~ .x |>
            gtummary::tbl_summary(
              by = .data[[groupvar]],
              missing = "no",



              type = list(
                gtsummary::all_continuous() ~ 'continuous2',
                sumvar ~ sumvar_type
              ),
              statistic = list(
                gtsummary::all_continuous2() ~ c(
                  "{median} ({p25}, {p75})",
                  "{min}, {max}"
                  )


                # type = list(sumvar ~ 'continuous')
              ),

              digits = list(gtsummary::all_continuous2() ~ digits)

            )|>
            gtsummary::add_n()
        ) |>

        gtsummary::modify_caption(
          caption = caption
        ) |>

        gtsummary::modify_header(label = paste0("**",label_name,"**")) |>

        gtsummary::as_flex_table() |>

        flextable::add_footer_lines(
          notes
        )




      saveRDS(sum_tab, paste0(file_path,"sumtab_",tab_name,".rda"))

    }



  }

  return(sum_tab)
}

#' Title
#'
#' @param dataset
#' @param row variable to put on the row
#' @param col variable to put in the columns
#' @param percent
#' @param notes notes to put in the footer
#' @param caption what to caption the table as
#' @param stratavar strata variable
#' @param tab_name name to save table as
#' @param load_tab load an already saved table: T or F
#' @param label_name
#' @param file_path file path to save table
#'
#' @return
#' @export
#'
#' @examples
cross_table = function(
    dataset,
    row,
    col,
    percent,
    notes = NULL,
    caption,stratavar = NULL,
    tab_name,load_tab = F,
    label_name = "",
    file_path
    ){




  if(load_tab){

    cross_tab =  readRDS(paste0(file_path,'./cross_',tab_name,'.rds'))


  } else {


    if(purrr::is_empty(stratavar)){

      row_label = sjlabelled::get_label(dataset[[row]])
      col_label = sjlabelled::get_label(dataset[[col]])


      dataset_filter = dataset |>
        dplyr::select(row,col) |>
        dplyr::filter(.data[[row]] != 'Not Applicable',
                      .data[[col]] != 'Not Applicable') |>
        dplyr::mutate(
          dplyr::across(
            .cols = c(row,col),
            .fns = factor
          )
        )

      sjlabelled::set_label(dataset_filter[[row]]) = row_label
      sjlabelled::set_label(dataset_filter[[col]]) = col_label

    } else {


      row_label = sjlabelled::get_label(dataset[[row]])
      col_label = sjlabelled::get_label(dataset[[col]])


      dataset_filter = dataset |>
        dplyr::select(row,col,stratavar) |>
        dplyr::filter(.data[[row]] != 'Not Applicable',
                      .data[[col]] != 'Not Applicable',
                      .data[[stratavar]] != 'Not Applicable') |>
        dplyr::mutate(
          dplyr::across(
            .cols = c(row,col,stratavar),
            .fns = factor
          )
        )

      sjlabelled::set_label(dataset_filter[[row]]) = row_label
      sjlabelled::set_label(dataset_filter[[col]]) = col_label

    }


    if(purrr::is_empty(stratavar)){

      cross_tab  = dataset_filter |>
        gtsummary::tbl_cross(
          row = .data[[row]],
          col = .data[[col]],
          percent = 'row',
          missing = 'no'
        ) |>

        gtsummary::modify_caption(
          caption = caption
        ) |>

        # gtsummary::modify_header(label = paste0("**",label_name,"**")) |>

        gtsummary::as_flex_table() |>

        flextable::add_footer_lines(
          notes
        )

      saveRDS(cross_tab,paste0(file_path,'./cross_',tab_name,'.rds'))


    } else {


      cross_tab  = dataset_filter |>
        gtsummary::tbl_strata(
          strata = .data[[stratavar]],
          .tbl_fun =
            ~ .x |>
            gtsummary::tbl_cross(row = .data[[row]],col = .data[[col]],percent = 'row')
        )  |>

        gtsummary::modify_caption(
          caption = caption
        ) |>

        gtsummary::modify_header(label = paste0("**",label_name,"**")) |>

        gtsummary::as_flex_table() |>

        flextable::add_footer_lines(
          notes
        )


      saveRDS(cross_tab,paste0(file_path,'./cross_',tab_name,'.rds'))


    }


  }


  return(cross_tab)
}

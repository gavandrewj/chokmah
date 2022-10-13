#' Title
#'
#' @param variable_names
#' @param variable_labels
#'
#' @return
#' @export
#'
#' @examples
codebook_prep_toc = function(variable_names,variable_labels){
  # generate the mini table of contents for this set of variables
  page_numbers = c()

  for(name in variable_names){
    page_numbers = c(paste0("\\pageref{",name,"} \n"),page_numbers)
  }

  toc_code = data.frame(
    variable_name = variable_names,
    variable_label = variable_labels,
    pages = rev(page_numbers)
  ) |>
    dplyr::rename(
      "Variable"  = variable_name,
      "Variable Label" = variable_label,
      "Page" = pages
    ) |>
    huxtable::huxtable() |>
    huxtable::theme_article() |>
    huxtable::set_width(0.9) |>
    huxtable::map_align(huxtable::by_cols(c('center','left','center'))) |>
    huxtable::set_col_width(c(0.15,0.75,0.1)) |>
    huxtable::set_top_padding(row = 2:length(variable_names),col = 1:3, value = 2) |>
    huxtable::set_bottom_padding(row = 2:length(variable_names),col = 1:3, value = 2) |>
    huxtable::set_font_size(10) |>
    huxtable::set_all_borders(huxtable::brdr(0.4, "solid", "black")) |>
    huxtable::to_latex(tabular_only = T)




  toc_code = gsub(pattern = '$\\backslash$pageref\\',replacement = '\\pageref',toc_code,fixed = T)


  for(name in variable_names){

    tofind = paste0("\\pageref{",gsub(pattern = "\n",replacement = "",commonmark::markdown_latex(name)),"\\}  \\newline")
    toc_code = gsub(pattern = tofind,replacement = paste0("\\pageref{",name,"}"),toc_code,fixed = T)

  }
  # \\pageref{var2\\}  \\newline
  # first_final = stringr::str_split(toc_code,pattern = "\n") |> unlist()
  # toc_code = paste0(first_final,collapse = "\n")
  toc_code |> cat()
}

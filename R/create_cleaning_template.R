#' Title
#'
#' @param path
#'
#' @return
#' @export
#'
#' @examples
create_cleaning_template = function(path){

  # copy and create the r file
  file.copy(
  "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/cleaning_template.R",
  path,
  overwrite = T
  )

  # copy and create the excel file
  file.copy(
    "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/meta_data.xlsx",
    path,
    overwrite = T
  )

  file.copy(
    "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/snippet_info.R",
    path,
    overwrite = T
  )

}


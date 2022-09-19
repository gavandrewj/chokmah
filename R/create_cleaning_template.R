#' Title
#'
#' @param path
#' @param folder_name
#' @param overwrite
#'
#' @return
#' @export
#'
#' @examples
create_cleaning_template = function(path,folder_name,overwrite = F){

  path = paste0(path,"/",folder_name)

  # meta_path =  paste0(new_path,"/meta_files")
  # main_path =  paste0(new_path,"/main_files")
  # codebook_path =  paste0(new_path,"/codebook_files")
  # missing_path =  paste0(new_path,"/missing_files")
  # misc_path =  paste0(new_path,"/misc_files")
  # clean_path =  paste0(new_path,"/cleaned_datafiles")
  # download_path =  paste0(new_path,"/downloads")
  #
  dir.create(path)
  # dir.create(main_path)
  # dir.create(meta_path)
  # dir.create(codebook_path)
  # dir.create(misc_path)
  # dir.create(clean_path)
  # dir.create(missing_path)
  # dir.create(download_path)
  #
  #
  # # copy files into the folders
  #
  # # copy and create the r file
  # file.copy(
  # "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/cleaning_template.R",
  # main_path,
  # overwrite = overwrite
  # )
  #
  # # copy and create the excel file
  # file.copy(
  #   "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/meta_data.xlsx",
  #   meta_path,
  #   overwrite = overwrite
  # )
  #
  # # copy and create the snippet file with the coding short cuts
  # file.copy(
  #   "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/snippet_info.R",
  #   misc_path,
  #   overwrite = overwrite
  # )
  #
  # file.copy(
  #   "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/codebook_template.Rmd",
  #   codebook_path,
  #   overwrite = overwrite
  # )
  #
  # file.copy(
  #   "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/cleaning_instructions.Rmd",
  #   misc_path,
  #   overwrite = overwrite
  # )
  R.utils::copyDirectory(
    from = "C:/Users/gavin/Documents/R/chokmah/misc/cleaning_tools/cleaning_sample",
    to = path,
    overwrite = overwrite
  )



}


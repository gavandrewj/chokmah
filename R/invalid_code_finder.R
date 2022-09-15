#' Title
#'
#' @param variable name of variable in dataset to check for invalid codes
#' @param write_meta whether you want to write the invalid codes you find to the meta data file
#' @param meta_path this xlsx type meta data file must contain a column labelled possible_invalid_codes and invalid_codes. The possible invalid codes must be separated by a comma and entered as a string
#' @param dataset
#'
#' @return
#' @export
#'
#' @examples
invalid_code_finder = function(variable,dataset,write_meta = F,meta_path){

  meta_data = readRDS(meta_path)


  # split a string that that contains the possible invalid codes separated by , only and removes whitespace
  possible_invalid_codes = stringr::str_split(meta_data[which(meta_data[['var_name']] == variable),"possible_invalid_codes"],",")  |> unlist() |> stringr::str_trim()
  possible_invalid_codes = gsub(x = possible_invalid_codes,pattern = '\"', replacement = "", fixed = TRUE)


  #  find all invalid codes that are present and return only those which are
  invalid_codes = paste0(possible_invalid_codes[possible_invalid_codes %in% dataset[[variable]]],collapse = ",")


  # write to the meta data what invalid codes have been found for a variable

  if(write_meta == T){

    if(invalid_codes == ""){
      invalid_append = '&nbsp;'
    } else {
      invalid_append = invalid_codes
    }

    meta_data[which(meta_data[['var_name']] == variable),"invalid_codes"] = invalid_append
    meta_data = meta_data |> dplyr::select(-dplyr::starts_with("NA"))


    saveRDS(
      meta_data,
      file = meta_path
    )
  }

  invalid_codes = stringr::str_split(invalid_codes,pattern = ",")  |> unlist() |> stringr::str_trim()

  return(invalid_codes)

}



#' Title
#'
#' @param names
#' @param labels
#' @param low_count
#' @param up_count
#' @param add_count
#' @param want_iter
#'
#' @return
#' @export
#'
#' @examples
codebook_toc = function(
    names,
    labels,
    low_count = 1,
    up_count = 22,
    add_count = 22,
    want_iter = 1
){

  table_names = list()
  table_labels = list()


  # split the names and labels into the appropriate name lengths
  for(i in 1:ceiling(length(names)/add_count)){

    table_names[[i]] = names[low_count:up_count]
    table_labels[[i]] = labels[low_count:up_count]


    low_count =  up_count + 1
    up_count = up_count + add_count

  }


  # generate and spit the tables into rmarkdown
  for(i in 1:want_iter){

    codebook_prep_toc(
      variable_names = table_names[[i]] ,
      variable_labels = table_labels[[i]]
    )


  }

}

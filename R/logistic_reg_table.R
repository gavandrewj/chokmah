#' Title
#'
#' @param dataset
#' @param yvar outcome variable
#' @param xvars independent variables
#' @param family distribution for outcome variable
#' @param to_exp exponentitate the results
#' @param caption caption to apply
#' @param notes footer notes
#' @param gt_tab return the gt table; T or F
#' @param both_tabs return both the gt table and the flextable
#' @param load_tab load an already saved table
#' @param tab_name name to save the table
#' @param factor_notapp which variables have not appliable to filter out
#' @param intercept show the intercept; T or F
#' @param file_path give the file path to save/find the table
#'
#' @return
#' @export
#'
#' @examples
logistic_reg_table = function(
    dataset,
    yvar,
    xvars,
    family,
    to_exp = T,
    caption,
    notes = NULL,
    gt_tab = FALSE,
    both_tabs = T,
    load_tab = F,
    tab_name,
    factor_notapp = NULL,
    intercept = F,
    file_path
    ){



  if(load_tab){

    gt_table =  readRDS(paste0(file_path,'./gt_',tab_name,'.rds'))
    flex_table =   readRDS(paste0(file_path,'./flex_',tab_name,'.rds'))
    model = readRDS(paste0(file_path,'./regmodel_',tab_name,'.rds'))


  } else {


    if(!purrr::is_empty(factor_notapp)){


      all_labels = c()

      for(var in factor_notapp){
        all_labels  =  c(all_labels,sjlabelled::get_label(dataset[[var]]) )

        dataset = dataset |>
          dplyr::filter(.data[[var]] != 'Not Applicable') |>
          dplyr::mutate(
            dplyr::across(
              .cols = var,
              .fns = factor
            )
          )
      }

      for(i in 1:length(factor_notapp)){

        sjlabelled::set_label(dataset[[factor_notapp[i]]]) = all_labels[i]

      }
    }




    # dataset = dataset |>
    #   dplyr::select(yvar,xvars) |>
    #   tidyr::drop_na()

    model = dataset |>
      glm(
        formula =  arsenal::formulize(
          y = yvar,
          x = xvars
        ),
        family = family
      )

    gt_table = model |>
      gtsummary::tbl_regression(
        exponentiate = to_exp,
        intercept = intercept
      )
    # |> gtsummary::add_n()


    flex_table = gt_table |>
      gtsummary::modify_caption(caption) |>
      gtsummary::as_flex_table() |>
      flextable::add_footer_lines(notes)

    saveRDS(gt_table,paste0(file_path,'./gt_',tab_name,'.rds'))
    saveRDS(flex_table,paste0(file_path,'./flex_',tab_name,'.rds'))
    saveRDS(model,paste0(file_path,'./regmodel_',tab_name,'.rds'))


  }



  model_point_estimate = round(exp(coef(model)),2)
  model_lower_interval = round(exp(confint(model)[,1]),2)
  model_upper_interval = round(exp(confint(model)[,2]),2)




  if(gt_tab){

    output = list(
      gt_table = gt_table,
      point_estimate = model_point_estimate,
      lower = model_lower_interval,
      upper = model_upper_interval
    )

    return(output)

  } else if(both_tabs){



    output = list(
      gt_table = gt_table,
      flex_table = flex_table,
      point_estimate = model_point_estimate,
      lower = model_lower_interval,
      upper = model_upper_interval,
      model = model
    )

    return(
      output
    )

  } else {


    output = list(
      flex_table = flex_table,
      point_estimate = model_point_estimate,
      lower = model_lower_interval,
      upper = model_upper_interval,
      model = model
    )

    return(
      output
    )
  }


}


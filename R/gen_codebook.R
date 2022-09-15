#' Title
#'
#' @param varname
#' @param meta_data
#' @param dataset
#'
#' @return
#' @export
#'
#' @examples
gen_codebook = function(varname,meta_data,dataset){


  # find the position of the variable in the meta datafile
  info_position = which(meta_data[['var_name']] == varname)

  # subset some stuff for easy substitution
  variable_name = meta_data[['var_name']][info_position]
  # |> commonmark::markdown_latex()
  # variable_name = gsub(x = variable_name,pattern = '\n', replacement = "", fixed = TRUE)
  variable_type = meta_data[['var_type']][info_position]
  special_vartype = variable_type = meta_data[['var_special']][info_position]
  variable_inttype = meta_data[['interval_type']][info_position]
  variable_missvals = meta_data[['invalid_codes']][info_position]
  variable_newpage =  meta_data[['new_page']][info_position] |> as.logical()
  table_break_vals = meta_data[['table_break']][info_position]
  table_break_vals = gsub(x = table_break_vals,pattern = '\"', replacement = "", fixed = TRUE)
  num_table_breaks = length(table_break_vals |> stringr::str_split(pattern = ",") |> unlist())

  # initialize the output vector
  out = c()

  if(variable_newpage == T){
    knit_expanded <- paste0("\\newpage")
    out = c(out,knit_expanded)
  }

  # Beam
  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)


  knit_expanded <- paste0("\n```{r results='asis'}\n\nheader_beam(meta_data[['var_name']][",info_position,"] |> commonmark::markdown_latex() |> as.character())\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\nheader_beam(meta_data[['brief_desc']][",info_position,"] |> commonmark::markdown_latex() |> as.character())\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)


  # Location

  # knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  # out = c(out,knit_expanded)
  #
  # knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('Location:')\n\n```")
  # out = c(out,knit_expanded)
  #
  # knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  # out = c(out,knit_expanded)
  #
  # knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('1843-1845 (width: 3; decimal: 0)')\n\n```")
  # out = c(out,knit_expanded)
  #
  # knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  # out = c(out,knit_expanded)



  # variable type

  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('Variable Type:')\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('",variable_type,"')\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)


  # Interval

  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('Interval:')\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('",variable_inttype,"')\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)


  # Range of Missing Values

  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('Range of Missing Values (M):')\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('",variable_missvals,"')\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)



  # question label

  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)


  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('Question:')\n\n```")

  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)

  knit_expanded <- paste0('\n```{r results="asis"}\n\ncat(meta_data[["var_label"]][',info_position,'] |> commonmark::markdown_latex() |> as.character())\n\n```')
  out = c(out,knit_expanded)

  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)




  if(is.na(special_vartype) & variable_inttype == "discrete" & sum(is.na(table_break_vals)) == 1){
    # if(dothing == T){

    knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
    out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
value_table = tables$value_table\n\n
value_table = huxtable(value_table) |> theme_blue() |> set_width(0.96) |>
                        set_col_width(c(0.1,0.5,0.17,0.15)) |> huxtable::map_align(by_cols('center','left', 'right','right')) |>
style_header_cols(align = 'center')  |>
to_latex(tabular_only = T) \n
gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()\n\n```")
    out = c(out,knit_expanded)


    # knit_expanded <- paste0("\n```{r results='asis'}\n\n
    #                         paste0('\\\\FloatBarrier \n \\\\label{",variable_name,"} \n \\\\FloatBarrier \n')  |> cat()
    #                         \n\n```")
    # out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
    out = c(out,knit_expanded)
  } else if(is.na(special_vartype) & variable_inttype == "continuous" & sum(is.na(table_break_vals)) == 1){
    # if(dothing == T){

    knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
    out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
    out = c(out,knit_expanded)





    knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
value_table = tables$value_table\n\nhuxtable(value_table) |> theme_blue() |> huxtable::set_width(1.1) |>
                        set_col_width(c(0.5,0.17,0.15)) |>
                        huxtable::map_align(by_cols('left','center', 'center')) |> style_header_cols(align = 'center') |>  to_latex(tabular_only = T) |> cat()\n\n```")

    out = c(out,knit_expanded)


    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
    out = c(out,knit_expanded)



  } else if(is.na(special_vartype) & variable_inttype == "continuous" & sum(is.na(table_break_vals)) != 1){

    for(i in 0:num_table_breaks){


      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)





      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
                              value_table = tables$value_table\n
                              all_tables = split(value_table, cumsum(1:nrow(value_table) %in% c(",table_break_vals,")))\n

                              \nhuxtable(all_tables[['",i,"']]) |> theme_blue() |> huxtable::set_width(1.105) |>
                        set_col_width(c(0.5,0.17,0.15)) |>
                        huxtable::map_align(by_cols('left','center', 'center')) |> style_header_cols(align = 'center') |>  to_latex(tabular_only = T) |> cat()\n\n```")

      out = c(out,knit_expanded)


      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)


    }


  } else if(is.na(special_vartype) & variable_inttype == "discrete" & sum(is.na(table_break_vals)) != 1){


    for(i in 0:num_table_breaks){


      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)





      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
                              value_table = tables$value_table\n
                              all_tables = split(value_table, cumsum(1:nrow(value_table) %in% c(",table_break_vals,")))\n

                              \nhuxtable(all_tables[['",i,"']]) |>  theme_blue() |> set_width(0.96) |>
                        set_col_width(c(0.125,0.3,0.125,0.125,0.3,0.125,0.125,0.125)) |> huxtable::map_align(by_cols('left','left','left','left','left','left','left','left')) |> style_header_cols(align = 'center') |>  to_latex(tabular_only = T) |> cat()\n\n```")

      out = c(out,knit_expanded)


      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)


    }


  } else if(special_vartype == "date" & variable_inttype == "discrete" & sum(is.na(table_break_vals)) == 1){



    knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
    out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
value_table = tables$value_table\n\n
value_table = huxtable(value_table) |> theme_blue() |> set_width(0.96) |>
                        set_col_width(expss::prop(0.15,0.7,0.2)) |> huxtable::map_align(by_cols('center','left', 'center')) |>
style_header_cols(align = 'center')  |>
to_latex(tabular_only = T) \n
gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()\n\n```")
    out = c(out,knit_expanded)


    # knit_expanded <- paste0("\n```{r results='asis'}\n\n
    #                         paste0('\\\\FloatBarrier \n \\\\label{",variable_name,"} \n \\\\FloatBarrier \n')  |> cat()
    #                         \n\n```")
    # out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
    out = c(out,knit_expanded)






  }




  # summary stats

  if(is.na(special_vartype) & variable_inttype == "discrete"){


  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)



  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
  out = c(out,knit_expanded)




  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)


  knit_expanded <- paste0("\n```{r results='asis'}\n\n
sum_table = tables$sum_table\n\nhuxtable(sum_table) |> theme_blue() |> set_width(0.75) |>
set_col_width(c(0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125)) |>
huxtable::map_align(by_cols('left','left','left','left','left','left','left','left')) |>
huxtable::set_left_padding(1, c(2,5), 0 ) |>
huxtable::set_left_padding(2, 1:8, 10 ) |>
to_latex(tabular_only = T) |> cat()\n\n```")
  out = c(out,knit_expanded)



  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)

  } else if(is.na(special_vartype) & variable_inttype == "continuous"){

    knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
    out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
    out = c(out,knit_expanded)


    knit_expanded <- paste0("\n```{r results='asis'}\n\n
sum_table = tables$sum_table\n\nhuxtable(sum_table) |> theme_blue() |> set_width(0.71) |>
set_col_width(expss::prop(c(0.08,0.09,0.08,0.08,0.125,0.08,0.08,0.08,0.08))) |>
huxtable::map_align(by_cols('left','left','left','left','left','left','left','left')) |>
huxtable::set_left_padding(1, 1:8, 0 ) |>
huxtable::set_left_padding(2, 1:8, 0 ) |>
to_latex(tabular_only = T) |> cat()\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
    out = c(out,knit_expanded)

} else if(special_vartype == "date" & variable_inttype == "discrete"){

  knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
  out = c(out,knit_expanded)



  knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
  out = c(out,knit_expanded)




  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
  out = c(out,knit_expanded)


  knit_expanded <- paste0("\n```{r results='asis'}\n\n
sum_table = tables$sum_table\n\nhuxtable(sum_table) |> theme_blue() |> set_width(0.75) |>
set_col_width(expss::prop(c(1,1,1,1,1,1))) |>
huxtable::map_align(by_cols('left','left','left','left','left','left')) |>
huxtable::set_left_padding(1, c(2,5), 0 ) |>
huxtable::set_left_padding(2, 1:6, 10 ) |>
to_latex(tabular_only = T) |> cat()\n\n```")
  out = c(out,knit_expanded)



  knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
  out = c(out,knit_expanded)

}


  return(out)

}

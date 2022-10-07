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
  question_type = meta_data[meta_data[['var_name']] == varname,"question_type"]

  code_tables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = varname)
  meta_data <- readRDS(meta_path)
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


  if(as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"])){


    knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
    out = c(out,knit_expanded)



    knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
    out = c(out,knit_expanded)




    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
    out = c(out,knit_expanded)





    knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
value_table = tables$value_table\n\n

value_table = huxtable(value_table) |> theme_article() |> huxtable::set_width(0.5) |>
                        set_col_width(expss::prop(c(2,2))) |>
                        huxtable::map_align(by_cols(c('center','center'))) |>
                        style_header_cols(align = 'center') |>
                        huxtable::set_number_format(NA) |>
                        set_top_padding(row = 1:(nrow(value_table)+1),col = 1:2, value = 2) |>
                        set_bottom_padding(row = 1:(nrow(value_table)+1),col = 1:2, value = 2) |>
               to_latex(tabular_only = T) \n
               gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat() \n\n```")

    out = c(out,knit_expanded)


    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n \\vspace*{-7mm} \n```\n\n")
    out = c(out,knit_expanded)



  } else {



  if(
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "decimal" & sum(is.na(table_break_vals)) == 1 |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "integer" & sum(is.na(table_break_vals)) == 1 |
    meta_data[meta_data[['var_name']] == varname,"question_type"] == "calculate" & sum(is.na(table_break_vals)) == 1
    ){

    knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
    out = c(out,knit_expanded)

    knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
    out = c(out,knit_expanded)

    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
    out = c(out,knit_expanded)

    knit_expanded <- paste0("\n```{r ",paste0(varname,"_rainplot"),",fig.retina = 5,fig.height = 1.5,fig.width = 5.5",ifelse(sum(is.na(dataset[[varname]])) == nrow(dataset),",results = 'asis'",""),"}\n\n
                            plot = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')$plot\n
                            if(sum(is.na(dataset[['",varname,"']])) == nrow(dataset)){'&nbsp;' |> cat()} else {plot}
                            \n\n```")

    out = c(out,knit_expanded)

    knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n \\vspace*{",if(ncol(chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = varname)$value_table) == 1){-6}else{0.5},"mm} \n```\n\n")

    out = c(out,knit_expanded)

  }



  if(meta_data[meta_data[['var_name']] == varname,"var_type"] == "numeric" & sum(is.na(table_break_vals)) == 1){


    if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "discrete"){
      # if(dothing == T){

      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
               value_table = tables$value_table\n\n

               if(ncol(value_table) == 1){ \n

                        cat('&nbsp;')

                         } else { \n

               value_table = huxtable(value_table) |>
               theme_article() |>
               set_width(if(ncol(value_table) == 4){0.88} else {0.9155}) |>
               set_col_width(expss::prop(if(ncol(value_table) == 4){c(1,4,2,1.2)} else {c(1,2,1)})) |>
               huxtable::map_align(by_cols(if(ncol(value_table) == 4){c('center','left', 'center','center')} else {c('center','center','center')})) |>
               style_header_cols(align = 'center')  |>
               set_top_padding(row = 1:(nrow(value_table)+1),col = 1:ncol(value_table), value = 0) |>
               set_bottom_padding(row = 1:(nrow(value_table)+1),col = 1:ncol(value_table), value = 0) |>
               to_latex(tabular_only = T) \n
               gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()}\n\n```")

            out = c(out,knit_expanded)

            knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n \\vspace*{-7mm} \n```\n\n")

            out = c(out,knit_expanded)



    } else if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "continuous"){


      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)





      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
value_table = tables$value_table\n\n
if(ncol(value_table) == 1){ \n

cat('&nbsp;')

} else { \n
value_table = huxtable(value_table) |> theme_article() |> huxtable::set_width(if(ncol(value_table) == 3) {0.91} else {0.88}) |>
                        set_col_width(expss::prop(if(ncol(value_table) == 3){c(1.5,3,1.5)} else {c(1,1.5,2,1)})) |>
                        huxtable::map_align(by_cols(if(ncol(value_table) == 3){c('center','center', 'center')} else {c('center','center','center','center')})) |>
                        style_header_cols(align = 'center') |>
                        huxtable::set_number_format(NA) |>
                        set_top_padding(row = 1:(nrow(value_table)+1),col = 1:1:ncol(value_table), value = 2) |>
                        set_bottom_padding(row = 1:(nrow(value_table)+1),col = 1:1:ncol(value_table), value = 2) |>
               to_latex(tabular_only = T) \n
               gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat() \n}\n\n```")

      out = c(out,knit_expanded)


      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n \\vspace*{-4mm} \n```\n\n")
      out = c(out,knit_expanded)



    }



  } else if(meta_data[meta_data[['var_name']] == varname,"var_type"] == "character" & sum(is.na(table_break_vals)) == 1){


    if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "text"){
      # if(dothing == T){

      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
               value_table = tables$value_table\n\n

               if(ncol(value_table) == 1){ \n

                          cat('&nbsp;')

                   } else { \n
               value_table = huxtable(value_table) |>
               theme_article() |>
               set_width(0.91) |>
               set_col_width(expss::prop(c(3,2,1))) |>
               huxtable::map_align(by_cols('left','center', 'center')) |>
               style_header_cols(align = 'center')  |>
               set_top_padding(row = 1:(nrow(value_table)+1),col = 1:1:ncol(value_table), value = 2) |>
               set_bottom_padding(row = 1:(nrow(value_table)+1),col = 1:1:ncol(value_table), value = 2) |>
               to_latex(tabular_only = T) \n
               gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()}\n\n```")

      out = c(out,knit_expanded)

      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n \\vspace*{-7mm} \n```\n\n")
      out = c(out,knit_expanded)



    } else if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "date"){

      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
               value_table = tables$value_table\n\n
               value_table = huxtable(value_table) |>
               theme_article() |>
               set_width(0.25) |>
               set_col_width(c(0.5,0.5)) |>
               huxtable::map_align(by_cols('center', 'center')) |>
               style_header_cols(align = 'center')  |>
               set_top_padding(row = 1:2,col = 1:ncol(value_table), value = 2) |>
               set_bottom_padding(row = 1:2,col = 1:ncol(value_table), value = 2) |>
               to_latex(tabular_only = T) \n
               gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()\n\n```")

      out = c(out,knit_expanded)

      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n \\vspace*{-7mm} \n```\n\n")

      out = c(out,knit_expanded)



    }



  } else if(meta_data[meta_data[['var_name']] == varname,"var_type"] == "numeric" & sum(is.na(table_break_vals)) != 1){


    if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "continuous"){

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

                              \nhuxtable(all_tables[['",i,"']]) |> theme_article() |> huxtable::set_width(1.105) |>
                        set_col_width(c(0.5,0.17,0.15)) |>
                        huxtable::map_align(by_cols('left','center', 'center')) |> style_header_cols(align = 'center') |>  to_latex(tabular_only = T) |> cat()\n\n```")

        out = c(out,knit_expanded)


        knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
        out = c(out,knit_expanded)


      }


    } else if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "discrete"){


      for(i in 0:num_table_breaks){


        knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
        out = c(out,knit_expanded)



        knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
        out = c(out,knit_expanded)




        knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
        out = c(out,knit_expanded)





        knit_expanded <- paste0("\n```{r results='asis'}\n\n

                                tables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n

                                value_table = tables$value_table\n

                                all_tables = split(value_table, cumsum(1:nrow(value_table) %in% c(",table_break_vals,"))) \n

                                all_tables[['",i,"']] = huxtable(all_tables[['",i,"']]) |>
                                theme_article() |>
                                set_width(if(ncol(all_tables[['",i,"']]) == 4){0.88} else {0.9155}) |>
                                huxtable::map_align(by_cols(if(ncol(all_tables[['",i,"']]) == 4){c('center','left', 'center','center')} else {c('center','center','center')})) |>
                                style_header_cols(align = 'center')  |>
                                set_bottom_padding(row = 1:(nrow(all_tables[['",i,"']])+1),col = 1:ncol(all_tables[['",i,"']]), value = 0) |>
                                set_top_padding(row = 1:(nrow(all_tables[['",i,"']])+1),col = 1:ncol(all_tables[['",i,"']]), value = 0) |>
                                to_latex(tabular_only = T) \n

                                gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',all_tables[['",i,"']],fixed = T) |> cat()\n\n```")

        out = c(out,knit_expanded)


        knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
        out = c(out,knit_expanded)


      }


    }


  } else if(meta_data[meta_data[['var_name']] == varname,"var_type"] == "character" & sum(is.na(table_break_vals)) != 1){

    if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "date"){



      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ntables = chokmah::gen_codetables(dataset = dataset,meta_path = meta_path,varname = '",varname,"')\n
value_table = tables$value_table\n\n
value_table = huxtable(value_table) |> theme_article() |> set_width(0.96) |>
                        set_col_width(expss::prop(0.15,0.7,0.2)) |> huxtable::map_align(by_cols('center','left', 'center')) |>
style_header_cols(align = 'center')  |>
to_latex(tabular_only = T) \n
gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)






    } else if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "text"){


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

                        if(ncol(all_tables[['",i,"']]) == 1){ \n

                          cat('&nbsp;')

                        } else { \n
                          value_table = huxtable(all_tables[['",i,"']]) |>
                            theme_article() |>
                            set_width(0.91) |>
                            set_col_width(expss::prop(c(3,2,1))) |>
                            huxtable::map_align(by_cols('left','center', 'center')) |>
                            style_header_cols(align = 'center')  |>
                            set_top_padding(row = 1:(nrow(all_tables[['",i,"']])+1),col = 1:ncol(all_tables[['",i,"']]), value = 0) |>
                            set_bottom_padding(row = 1:(nrow(all_tables[['",i,"']])+1),col = 1:ncol(all_tables[['",i,"']]), value = 0) |>
                            to_latex(tabular_only = T) \n
                          gsub(pattern = '\\\\end{tabularx}',replacement = '\\\\phantomsection\\n\\\\label{",varname,"}\\n\\\\end{tabularx}',value_table,fixed = T) |> cat()}\n\n```")

        out = c(out,knit_expanded)


        knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
        out = c(out,knit_expanded)




      }


    }



  }



}



  # summary stats

  if(as.logical(meta_data[meta_data[['var_name']] == varname,"suppress_valtab"])){



  } else if(meta_data[meta_data[['var_name']] == varname,"var_type"] == "numeric"){

    if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "discrete"){


      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)


      knit_expanded <- paste0("\n```{r results='asis'}\n\n
sum_table = tables$sum_table\n\nhuxtable(sum_table) |> theme_article() |> set_width(0.75) |>
set_col_width(c(0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125)) |>
huxtable::map_align(by_cols('left','left','left','left','left','left','left','left')) |>
huxtable::set_left_padding(1, c(2,5), 0 ) |>
huxtable::set_left_padding(2, 1:8, 10 ) |>
               set_top_padding(row = 1:2,col = 1:8, value = 0) |>
               set_bottom_padding(row = 1:2,col = 1:8, value = 0) |>
to_latex(tabular_only = T) |> cat()\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)

    } else if(meta_data[meta_data[['var_name']] == varname,"interval_type"] == "continuous"){

      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\n
            sum_table = tables$sum_table\n\nhuxtable(sum_table) |>
            theme_article() |>
            set_width(0.8) |>
            huxtable::set_number_format(NA) |>
            set_col_width(expss::prop(c(1,1,1,1,1,1,1))) |>
            huxtable::map_align(by_cols('center','center','center','center','center','center','center')) |>
            set_top_padding(row = 1:2,col = 1:ncol(sum_table), value = 0) |>
            set_bottom_padding(row = 1:2,col = 1:ncol(sum_table), value = 0) |>
            to_latex(tabular_only = T) |> cat()\n\n```")
      out = c(out,knit_expanded)


      # knit_expanded <- paste0("\n```{r results='asis'}\n\n
      #       sum_table = tables$sum_table_one\n\nhuxtable(sum_table) |>
      #       theme_article() |>
      #       set_width(0.846) |>
      #       set_col_width(expss::prop(c(1,1,1,1,1))) |>
      #       huxtable::map_align(by_cols('center','center','center','center','center')) |>
      #       huxtable::set_number_format(NA) |>
      #       set_top_padding(row = 1:2,col = 1:5, value = 2) |>
      #       set_bottom_padding(row = 1:2,col = 1:5, value = 2) |>
      #       to_latex(tabular_only = T) |> cat()\n\n```")
      # out = c(out,knit_expanded)


      # knit_expanded <- paste0("\n```{r results='asis'}\n\n
      #       sum_table = tables$sum_table_two\n\nhuxtable(sum_table) |>
      #       theme_article() |>
      #       set_width(0.88) |>
      #       set_col_width(expss::prop(c(1,1,1,1))) |>
      #       huxtable::map_align(by_cols('center','center','center','center')) |>
      #       huxtable::set_number_format(NA) |>
      #       set_top_padding(row = 1:2,col = 1:4, value = 2) |>
      #       set_bottom_padding(row = 1:2,col = 1:4, value = 2) |>
      #       to_latex(tabular_only = T) |> cat()\n\n```")
      # out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)


    }




  } else if(meta_data[meta_data[['var_name']] == varname,"var_type"] == "character"){


    if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "text"){

      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)


      knit_expanded <- paste0("\n```{r results='asis'}\n\n
              sum_table = tables$sum_table\n\nhuxtable(sum_table) |>
              theme_article() |>
              set_width(0.91) |>
              set_col_width(expss::prop(  if(ncol(sum_table) == 3)  {  c(1,1,1)  } else {c(1,1,1,1)} )) |>
              huxtable::map_align(by_cols( if(ncol(sum_table) == 3) {c('left','left','left')} else {c('left','left','left','left')}  )) |>
              set_top_padding(row = 1:2,col = if(ncol(sum_table) == 3) {1:3} else {1:4}, value = 0) |>
              set_bottom_padding(row = 1:2,col = if(ncol(sum_table) == 3) {1:3} else {1:4}, value = 0) |>
              to_latex(tabular_only = T) |> cat()\n\n```")

      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)

    }

    if(meta_data[meta_data[['var_name']] == varname,"question_type"] == "date"){

      knit_expanded <- paste0("\n```{=latex}\n\n\\begin{minipage}[t]{0.3\\linewidth}\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{r results='asis'}\n\ncat('&nbsp;')\n\n```")
      out = c(out,knit_expanded)




      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}%\n\\begin{minipage}[t]{0.7\\linewidth}\n\n```")
      out = c(out,knit_expanded)


      knit_expanded <- paste0("\n```{r results='asis'}\n\n
sum_table = tables$sum_table\n\nhuxtable(sum_table) |> theme_article() |> set_width(0.82) |>
set_col_width(expss::prop(c(1,1,1,1.25,1))) |>
huxtable::map_align(by_cols('center','center','center','center','center')) |>
huxtable::set_left_padding(1, 4, 0 ) |>
huxtable::set_left_padding(2, 1:2, 0 ) |>
               set_top_padding(row = 1:2,col = 1:5, value = 0) |>
               set_bottom_padding(row = 1:2,col = 1:5, value = 0) |>
to_latex(tabular_only = T) |> cat()\n\n```")
      out = c(out,knit_expanded)



      knit_expanded <- paste0("\n```{=latex}\n\n\\end{minipage}\n\n```\n\n")
      out = c(out,knit_expanded)

    }




  }





  return(out)

}

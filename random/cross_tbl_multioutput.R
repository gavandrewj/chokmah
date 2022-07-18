library(tidyverse)
library(sjlabelled)
library(effectsize)



load("~/GitHub/extubationFailure/data/comp_data.rda")



chi_tables = function(dataset,varname){


cramer_fun <- function(data, ...){

  var_names = names(data)

  effectsize::cramers_v(
    x = data[[var_names[1]]],
    y = data[[var_names[2]]]
  )  |>
    dplyr::as_tibble() |>
    dplyr::mutate(
      dplyr::across(
        .cols = gtsummary::everything(),
        .fns = ~ gtsummary::style_number(.x,digits = 2)
      )
    ) |>
      dplyr::mutate(ci = paste0(CI_low,',',CI_high)) |>
      dplyr::select(!c(CI,CI_low,CI_high)) |>
      dplyr::rename(
        "Cramer's V" = Cramers_v,
        "95% CI" = ci
      )

}


varname_label = sjlabelled::get_label(dataset[[varname]])

chi_cross = dataset |>

  dplyr::select(
    reintubate72Hr,
    varname
  ) |>

  tidyr::drop_na() |>

  dplyr::filter(.data[[varname]] != 'Not Applicable')



chi_cross[[varname]] = chi_cross[[varname]] |> factor() |>   sjlabelled::set_label(varname_label)


chi_cross = chi_cross |>

  gtsummary::tbl_cross(
    col = reintubate72Hr,
    row = varname,
    percent = "row",
    margin = NULL
  ) |>

  gtsummary::add_stat(gtsummary::everything() ~ cramer_fun) |>

  gtsummary::add_p() |>

  gtsummary::modify_footnote(gtsummary::everything() ~ NA)

return(chi_cross)

}


tables = lapply(
  c(
    "gender",
    "ethn"
  ),
  FUN = chi_tables,
  dataset = comp_data
)


gtsummary::tbl_stack(
tables
) |>
  gtsummary::as_flex_table() |>
  flextable::footnote(
    i = 2,j  = c(5),
    value = flextable::as_paragraph("Cramer's V"),
    part = "header",
    ref_symbols = "1"
  ) |>
  flextable::footnote(
    i = 2,j  = 5,
    value = flextable::as_paragraph("Confidence Interval"),
    part = "header",
    ref_symbols = "2"
  ) |>
  flextable::footnote(
    i = 2,j  = c(4,6),
    value = flextable::as_paragraph("Pearson's Chi-squared test"),
    part = "header",
    ref_symbols = "3"
  )



A <- c(48, 48, 77, 86, 85, 85)
B <- c(14, 34, 34, 77)

wilcox.test(A, B) # aka Mann–Whitney U test

cles(A, B, rank = TRUE) |>
  as.data.frame()


 cles(
  data =  comp_data,
  x = arsenal::formulize(x = "theatre",y = "q11")
  ) |>
  as_tibble() |>
   dplyr::filter(Parameter == "Pr(superiority)") |>
  dplyr::select(
    Coefficient,CI_low,CI_high
  ) |>
   mutate(
     across(
       .cols = everything(),
       .fns = ~round(.x,2)
     )
   ) |>
  mutate(
    ci = paste0(CI_low,',',CI_high)
  ) |>
   dplyr::select(
     Coefficient,ci
   ) |>
   rename(
     cles = Coefficient,
     "95% CI" = ci
   )


 cles_fun <- function(data, variable, by, ...) {

   cs_data = data |>
     mutate(
       across(
         .cols = variable,
         .fns = as.numeric
       )
     )

   effectsize::cles(
     data = cs_data,
     x = arsenal::formulize(x = by,y = variable)
   ) |>
     dplyr::as_tibble() |>
     dplyr::filter(Parameter == "Pr(superiority)") |>
     dplyr::select(
       Coefficient,CI_low,CI_high
     ) |>
     dplyr::mutate(
       dplyr::across(
         .cols =  dplyr::everything(),
         .fns = ~gtsummary::style_number(.x,digits = 2)
       )
     ) |>
     dplyr::mutate(
       ci = paste0(CI_low,',',CI_high)
     ) |>
     dplyr::select(
       Coefficient,ci
     ) |>
     dplyr::rename(
       cles = Coefficient,
       "95% CI" = ci
     )

 }


 cles_fun(data = comp_data,variable = 'q11',by = 'sex')


 wilcox_rank(dataset = plot_data,yvar = "q11",
             groupvar = "sex",tab_name = "wilcheck",
             file_path = getwd())


 plot_data |>
   dplyr::select(
     q11,
     theatre
   ) |>
   gtsummary::tbl_summary(
     by = "theatre"
   ) |>
   gtsummary::add_stat(
     q11 ~ cles_fun
   ) |>
   gtsummary::add_p(
     test = q11 ~ wilcox.test
   ) |>
   gtsummary::modify_header(label = "") |>
   gtsummary::modify_footnote(everything() ~ NA) |>
   gtsummary::as_flex_table() |>
   flextable::footnote(
     i = 1,j = c(2,3),
     value = flextable::as_paragraph(c("n (%)")),
     ref_symbols = c("1"),
     part = "head"
   ) |>
   flextable::footnote(
     i = 1,j = c(4,5),
     value = flextable::as_paragraph(c("Common Language Effect Size")),
     ref_symbols = c("2"),
     part = "head"
   ) |>
   flextable::footnote(
     i = 1,j = c(5),
     value = flextable::as_paragraph(c("Confidence Interval")),
     ref_symbols = c("3"),
     part = "head"
   ) |>
   flextable::footnote(
     i = 1,j = c(6),
     value = flextable::as_paragraph(c("Wilcoxon Rank Sum Test")),
     ref_symbols = c("4"),
     part = "head"
   )



dataset =
  data.frame(
    var = sample(c("Strongly Disagree","Disagree","Agree","Strongly Agree"),size = 200,replace = T),
    group = rep(c("Group A","Group B"),100)
  ) |>
  mutate(
    var = var |> factor(levels = c("Strongly Disagree","Disagree","Agree","Strongly Agree")) |>  set_label('Outcome Variable'),
    group =  group |> factor() |>  set_label("Group Variable")
  )


wilcox_rank(
  dataset = dataset,
  yvar = "var",
  groupvar = "group",
  tab_name = "wilcheck",
  file_path = getwd()
)

clean_continuous(dataset$var)
clean_discrete(dataset$var)

summary_tab(
  dataset = dataset,
  sumvar = "var",
  tab_name = "something",
  file_path = getwd()
)

library(tidyverse)
library(gtsummary)
library(flextable)
packageVersion("gtsummary")


data_set = data.frame(
  y =  sample(c(1,0),size = 2000,replace = T,prob = c(0.7,0.7)),
  x = rep(c("Group A","Group B"),each = 1000)
) |>
  mutate(
    y = y  |> sjlabelled::set_label("Outcome Variable"),
    x = x |> factor() |> sjlabelled::set_label("Group")
  )


chokmah::fishers_exact_result_table(
  dataset = data_set,
  yvar = 'y',
  groupvar = 'x',
  tab_name = 'fishytest',
  file_path = getwd(),
  caption = "cas",
  load_tab = T
)

phi(x = data_set$x,y = data_set$y)

# function to calculate OR from 2x2 table
or_fun <- function(data, variable, by, ...) {
  table(data[[by]], data[[variable]]) |>
    fisher.test() |>
    broom::tidy() |>
    mutate(
      method = "Fisher's Exact Test"
    )
}


or_fun(trial, "trt", "response")



data_set |>
  select(y, x) |>
  tbl_summary(by = x,digits = y ~ c(0,0,2),type = list(y ~ 'continuous'), missing = "no", statistic = list(
    all_categorical() ~ "{n} / {N} ({p}%)",
    y ~ "{odds_numerator} / {odds_denominator} ({odds})")) |>
  add_difference(test = y ~ or_fun, estimate_fun = y ~ style_ratio) |>
  modify_header(estimate ~ "**Odds Ratio**") |>
  modify_header(label = paste0("**","","**")) |>
  modify_footnote(update = c(stat_1,stat_2) ~ "Odds") |>
  as_flex_table()




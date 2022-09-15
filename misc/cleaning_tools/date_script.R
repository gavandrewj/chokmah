library(timetk)

# pull all of the unique value labels
# get the count of the non-valid entries for each type of non-valid entry

a = m4_monthly |>
  dplyr::mutate(
    date = date |> as.character()
  )



names_vec = c(a = "ad")

date_label =
  setNames(
    object = c(
      -99,
      -1,
      unique(a$date)[3:470]
    ),
    nm = c(
      "Missing",
      "No response",
      rep("Valid Date",length(unique(a$date)[3:470]))
    )
  )

a$date[1:10] = "-99"
a$date[11:20] = "-1"

variable = "date"

b = a |>
  dplyr::mutate(
    date = date |> sjlabelled::set_labels(labels = date_label)
  )


dataset = b

codes = data.frame(
  values = sjlabelled::get_values(dataset[[varname]]),
  labels = sjlabelled::get_labels(dataset[[varname]])
) |>
  dplyr::filter(
    labels != "Valid Date"
  ) |>
  dplyr::mutate(
    freq = NA
  )

invalid_codes = codes$values
# coding_table

# possible_invalid_codes = "-99"


# codes = data.frame(
#   values = c("",possible_invalid_codes),
#   freq = NA,
#   labels = c("Valid Date",rep("",length(possible_invalid_codes)))
# )

codes

for(invalid_code in codes$values){

  codes[which(codes$values == invalid_code),'freq'] =   sum(dataset[[variable]] %in% invalid_code,na.rm = T)
  # codes$labels[which(codes$values == invalid_code)] =    coding_table$labels[which(coding_table$values == invalid_code)]
}

codes

codes[nrow(codes)+1,] = c(
  "",
  "Valid Date",
  nrow(dataset) - sum(codes$freq,na.rm = T)
)


codes

invalid_count = nrow(dataset) - as.numeric(codes$freq[which(codes$labels == "Valid Date")])
invalid_count

codes = codes  |>
  dplyr::mutate(
    freq = freq |> as.numeric(),
    freq = paste0(freq," (",paste(round(freq/sum(freq,na.rm = T) * 100,1),"%",sep = ""),")")
  )

codes

# add the format

sum_data =   data.frame(time_var = lubridate::ymd(dataset[[varname]][!dataset[[varname]] %in% invalid_codes]))


sum_data |>
  tk_summary_diagnostics() |>
  dplyr::select(
    start,
    end,
    units,
    tzone
  ) |>
  dplyr::mutate(
    "Format" = 'date_format',
    invalid_count = invalid_count
  ) |>
  dplyr::rename(
    Start = start,
    End = end,
    Units = units,
    "Time Zone" = 'time_zone'
  ) |>

  dplyr::relocate(
    invalid_count,.before = Start
  )

gen_codetables(dataset = dataset,varname = "date",meta_path = "",special_vartype = "date")

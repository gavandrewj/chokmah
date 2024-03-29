% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_table.R
\name{summary_tab}
\alias{summary_tab}
\title{Summary Table}
\usage{
summary_tab(
  dataset,
  sumvar,
  groupvar = NULL,
  tab_name,
  load_tab = F,
  stratavar = NULL,
  caption = "",
  label_name = "",
  notes = "",
  digits = 1,
  sumvar_type = "continuous2",
  file_path,
  sort = NULL,
  percent = "column"
)
}
\arguments{
\item{sumvar}{variables to summarize}

\item{groupvar}{grouping variable}

\item{tab_name}{name to save the table as}

\item{load_tab}{should you load an already saved table; T or F}

\item{stratavar}{strata variable}

\item{notes}{notes to put in the footer}

\item{sumvar_type}{continuous2 or categorical}

\item{file_path}{provide the location to store the table}

\item{sort}{}
}
\value{
currently a table in word format
}
\description{
Summary Table
}

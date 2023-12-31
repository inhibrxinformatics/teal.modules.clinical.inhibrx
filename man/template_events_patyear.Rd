% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_t_events_patyear.R
\name{template_events_patyear}
\alias{template_events_patyear}
\title{Template: Event rates adjusted for patient-years}
\usage{
template_events_patyear(
  dataname,
  parentname,
  arm_var,
  events_var,
  label_paramcd,
  aval_var = "AVAL",
  add_total = TRUE,
  total_label = "All Patients",
  control = control_incidence_rate(),
  drop_arm_levels = TRUE,
  basic_table_args = teal.widgets::basic_table_args()
)
}
\arguments{
\item{dataname}{(\code{character})\cr
analysis data used in teal module.}

\item{parentname}{(\code{character})\cr
parent analysis data used in teal module, usually this refers to \code{ADSL}.}

\item{arm_var}{(\code{character})\cr
variable names that can be used as \code{arm_var}.}

\item{events_var}{(\code{integer})\cr number of observed events.}

\item{label_paramcd}{(\code{string})\cr title of table based on \code{paramcd}}

\item{aval_var}{(\code{character})\cr
name of the analysis variable.}

\item{add_total}{(\code{logical})\cr
whether to include column with total number of patients.}

\item{control}{(\code{list})\cr list of settings for the analysis.}

\item{drop_arm_levels}{(\code{logical})\cr drop the unused \code{arm_var} levels.
When \code{TRUE}, \code{arm_var} levels are set to those used in the \code{dataname} dataset. When \code{FALSE},
\code{arm_var} levels are set to those used in the \code{parantname} dataset.}

\item{basic_table_args}{optional, (\code{basic_table_args})\cr
object created by \code{\link[teal.widgets:basic_table_args]{teal.widgets::basic_table_args()}} with settings for the module table.
The argument is merged with option \code{teal.basic_table_args} and with default module arguments
(hard coded in the module body).

For more details, see the vignette: \code{vignette("custom-basic-table-arguments", package = "teal.widgets")}.}
}
\description{
Template: Event rates adjusted for patient-years
}
\seealso{
\code{\link[=tm_t_events_patyear]{tm_t_events_patyear()}}
}
\keyword{internal}

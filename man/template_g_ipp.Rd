% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_g_ipp.R
\name{template_g_ipp}
\alias{template_g_ipp}
\title{Template: Individual Patient Plots}
\usage{
template_g_ipp(
  dataname = "ANL",
  paramcd,
  arm_var,
  arm_levels,
  avalu_first,
  paramcd_first,
  aval_var = "AVAL",
  avalu_var = "AVALU",
  id_var = "USUBJID",
  visit_var = "AVISIT",
  base_var = "BASE",
  add_baseline_hline = FALSE,
  separate_by_obs = FALSE,
  ggplot2_args = teal.widgets::ggplot2_args(),
  suppress_legend = FALSE,
  add_avalu = TRUE
)
}
\arguments{
\item{dataname}{(\code{character})\cr
analysis data used in teal module.}

\item{paramcd}{(\code{character})\cr
variable value designating the studied parameter.}

\item{arm_var}{(\code{character})\cr
variable names that can be used as \code{arm_var}.}

\item{arm_levels}{(\code{character})\cr vector of all arm variable levels.}

\item{avalu_first}{(\code{string})\cr \code{avalu} value.}

\item{paramcd_first}{(\code{string})\cr \code{paramcd} value.}

\item{aval_var}{(\code{character})\cr
name of the analysis variable.}

\item{avalu_var}{(\code{string})\cr variable name designating the unit of the analysis variable.}

\item{id_var}{(\code{character})\cr
the variable name for subject id.}

\item{visit_var}{(\code{string})\cr variable name designating the visit timepoint variable.}

\item{base_var}{(\code{string})\cr variable name designating the baseline values of analysis variable.}

\item{add_baseline_hline}{(\code{flag})\cr adds horizontal line at baseline y-value on plot}

\item{separate_by_obs}{(\code{flag})\cr creates multi panel plots when TRUE}

\item{ggplot2_args}{optional, (\code{ggplot2_args})\cr
object created by \code{\link[teal.widgets:ggplot2_args]{teal.widgets::ggplot2_args()}} with settings for the module plot.
For this module, this argument will only accept \code{ggplot2_args} object with \code{labs} list of following child elements:
\code{title}, \code{subtitle}, \code{x}, \code{y}.
No other elements would be taken into account. The argument is merged with option \code{teal.ggplot2_args} and
with default module arguments (hard coded in the module body).

For more details, see the vignette: \code{vignette("custom-ggplot2-arguments", package = "teal.widgets")}.}

\item{suppress_legend}{(\code{flag})\cr allow user to suppress legend}

\item{add_avalu}{(\code{flag})\cr allow user to not display value unit in the plot.}
}
\description{
Template: Individual Patient Plots
}
\keyword{internal}

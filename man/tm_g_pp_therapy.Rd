% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_g_pp_therapy.R
\name{tm_g_pp_therapy}
\alias{tm_g_pp_therapy}
\title{Teal Module: Patient Profile Therapy Teal Module}
\usage{
tm_g_pp_therapy(
  label,
  dataname = "ADCM",
  parentname = "ADSL",
  patient_col = "USUBJID",
  atirel = NULL,
  cmdecod = NULL,
  cmindc = NULL,
  cmdose = NULL,
  cmtrt = NULL,
  cmdosu = NULL,
  cmroute = NULL,
  cmdosfrq = NULL,
  cmstdy = NULL,
  cmendy = NULL,
  font_size = c(12L, 12L, 25L),
  plot_height = c(700L, 200L, 2000L),
  plot_width = NULL,
  pre_output = NULL,
  post_output = NULL,
  ggplot2_args = teal.widgets::ggplot2_args()
)
}
\arguments{
\item{label}{(\code{character})\cr
menu item label of the module in the teal app.}

\item{dataname}{(\code{character})\cr
analysis data used in teal module.}

\item{parentname}{(\code{character})\cr
parent analysis data used in teal module, usually this refers to \code{ADSL}.}

\item{patient_col}{(\code{character})\cr patient ID column to be used.}

\item{atirel}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{ATIREL} column of the \code{ADCM} dataset.}

\item{cmdecod}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMDECOD} column of the \code{ADCM} dataset.}

\item{cmindc}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMINDC} column of the \code{ADCM} dataset.}

\item{cmdose}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMDOSE} column of the \code{ADCM} dataset.}

\item{cmtrt}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMTRT} column of the \code{ADCM} dataset.}

\item{cmdosu}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMDOSU} column of the \code{ADCM} dataset.}

\item{cmroute}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMROUTE} column of the \code{ADCM} dataset.}

\item{cmdosfrq}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMDOSFRQ} column of the \code{ADCM} dataset.}

\item{cmstdy}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMSTDY} column of the \code{ADCM} dataset.}

\item{cmendy}{(\code{\link[teal.transform:choices_selected]{teal.transform::choices_selected()}} or \code{\link[teal.transform:data_extract_spec]{teal.transform::data_extract_spec()}})\cr
\code{CMENDY} column of the \code{ADCM} dataset.}

\item{font_size}{(\code{numeric})\cr numeric vector of length 3 for current, min and max font size values.}

\item{plot_height}{optional, (\code{numeric})\cr
a vector of length three with \code{c(value, min, max)}. Specifies the height of
the main plot and renders a slider on the plot to interactively adjust the plot
height.}

\item{plot_width}{optional, (\code{numeric})\cr
a vector of length three with \code{c(value, min, max)}. Specifies the width of
the main plot and renders a slider on the plot to interactively adjust the plot
width.}

\item{pre_output}{optional, (\code{shiny.tag})\cr
with text placed before the output to put the output into context.
For example a title.}

\item{post_output}{optional, (\code{shiny.tag})\cr
with text placed after the output to put the output into context. For example
the \code{\link[shiny:helpText]{shiny::helpText()}} elements are useful.}

\item{ggplot2_args}{optional, (\code{ggplot2_args})\cr
object created by \code{\link[teal.widgets:ggplot2_args]{teal.widgets::ggplot2_args()}} with settings for the module plot.
The argument is merged with option \code{teal.ggplot2_args} and with default module arguments
(hard coded in the module body).

For more details, see the help vignette: \code{vignette("custom-ggplot2-arguments", package = "teal.widgets")}.}
}
\description{
This teal module produces a patient profile therapy plot using \code{ADaM} datasets.
}
\examples{
library(nestcolor)

adcm <- tmc_ex_adcm
adsl <- tmc_ex_adsl \%>\% dplyr::filter(USUBJID \%in\% adcm$USUBJID)
adcm$CMASTDTM <- adcm$ASTDTM
adcm$CMAENDTM <- adcm$AENDTM
adcm_keys <- c("STUDYID", "USUBJID", "ASTDTM", "CMSEQ", "ATC1", "ATC2", "ATC3", "ATC4")

app <- init(
  data = cdisc_data(
    cdisc_dataset("ADSL", adsl),
    cdisc_dataset("ADCM", adcm, keys = adcm_keys)
  ),
  modules = modules(
    tm_g_pp_therapy(
      label = "Therapy",
      dataname = "ADCM",
      parentname = "ADSL",
      patient_col = "USUBJID",
      plot_height = c(600L, 200L, 2000L),
      atirel = choices_selected(
        choices = variable_choices(adcm, "ATIREL"),
        selected = c("ATIREL")
      ),
      cmdecod = choices_selected(
        choices = variable_choices(adcm, "CMDECOD"),
        selected = "CMDECOD"
      ),
      cmindc = choices_selected(
        choices = variable_choices(adcm, "CMINDC"),
        selected = "CMINDC"
      ),
      cmdose = choices_selected(
        choices = variable_choices(adcm, "CMDOSE"),
        selected = "CMDOSE"
      ),
      cmtrt = choices_selected(
        choices = variable_choices(adcm, "CMTRT"),
        selected = "CMTRT"
      ),
      cmdosu = choices_selected(
        choices = variable_choices(adcm, "CMDOSU"),
        selected = c("CMDOSU")
      ),
      cmroute = choices_selected(
        choices = variable_choices(adcm, "CMROUTE"),
        selected = "CMROUTE"
      ),
      cmdosfrq = choices_selected(
        choices = variable_choices(adcm, "CMDOSFRQ"),
        selected = "CMDOSFRQ"
      ),
      cmstdy = choices_selected(
        choices = variable_choices(adcm, "ASTDY"),
        selected = "ASTDY"
      ),
      cmendy = choices_selected(
        choices = variable_choices(adcm, "AENDY"),
        selected = "AENDY"
      )
    )
  )
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}

}

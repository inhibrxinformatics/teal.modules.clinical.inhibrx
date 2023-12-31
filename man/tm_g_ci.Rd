% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_g_ci.R
\name{tm_g_ci}
\alias{tm_g_ci}
\title{Teal Module: Confidence Interval Plot (\code{CIG01})}
\usage{
tm_g_ci(
  label,
  x_var,
  y_var,
  color,
  stat = c("mean", "median"),
  conf_level = teal.transform::choices_selected(c(0.95, 0.9, 0.8), 0.95, keep_order =
    TRUE),
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

\item{x_var}{(\code{character})\cr treatment variable corresponding to the x axis.}

\item{y_var}{(\code{character})\cr response variable corresponding to the y axis.}

\item{color}{(\code{data_extract_spec})\cr the group variable (color, line type
and point shape).}

\item{stat}{(\code{character})\cr either \code{mean} or \code{median}.}

\item{conf_level}{(\code{choices_selected})\cr
object with all available choices and preselected option for the confidence
level, each within range of (0, 1).}

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
The module generates the R code and returns the corresponding output.
}
\examples{
library(nestcolor)

adsl <- tmc_ex_adsl
adlb <- tmc_ex_adlb

app <- init(
  data = cdisc_data(
    cdisc_dataset("ADSL", adsl),
    cdisc_dataset("ADLB", adlb)
  ),
  modules = modules(
    tm_g_ci(
      label = "Confidence Interval Plot",
      x_var = data_extract_spec(
        dataname = "ADSL",
        select = select_spec(
          choices = c("ARMCD", "BMRKR2"),
          selected = c("ARMCD"),
          multiple = FALSE,
          fixed = FALSE
        )
      ),
      y_var = data_extract_spec(
        dataname = "ADLB",
        filter = list(
          filter_spec(
            vars = "PARAMCD",
            choices = levels(adlb$PARAMCD),
            selected = levels(adlb$PARAMCD)[1],
            multiple = FALSE,
            label = "Select lab:"
          ),
          filter_spec(
            vars = "AVISIT",
            choices = levels(adlb$AVISIT),
            selected = levels(adlb$AVISIT)[1],
            multiple = FALSE,
            label = "Select visit:"
          )
        ),
        select = select_spec(
          label = "Analyzed Value",
          choices = c("AVAL", "CHG"),
          selected = "AVAL",
          multiple = FALSE,
          fixed = FALSE
        )
      ),
      color = data_extract_spec(
        dataname = "ADSL",
        select = select_spec(
          label = "Color by variable",
          choices = c("SEX", "STRATA1", "STRATA2"),
          selected = c("STRATA1"),
          multiple = FALSE,
          fixed = FALSE
        )
      )
    )
  ),
  header = "Example of Confidence Interval Plot",
  footer = shiny::tags$p(
    class = "text-muted", "Source: `teal.modules.clinical::tm_g_ci`"
  )
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}

}

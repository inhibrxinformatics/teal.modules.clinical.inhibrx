% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{split_choices}
\alias{split_choices}
\title{Split \code{choices_selected} objects with interactions into
their component variables}
\usage{
split_choices(x)
}
\arguments{
\item{x}{(\code{choices_selected})\cr
object with interaction terms}
}
\description{
Split \code{choices_selected} objects with interactions into
their component variables
}
\note{
uses the regex \verb{\\\\*|:} to perform the split.
}

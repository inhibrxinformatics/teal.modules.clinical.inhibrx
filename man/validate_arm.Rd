% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate_standard_inputs.R
\name{validate_arm}
\alias{validate_arm}
\title{Check if vector is valid as to be used as a treatment arm variable}
\usage{
validate_arm(arm_vec)
}
\arguments{
\item{arm_vec}{vector to be validated}
}
\description{
Check if vector is valid as to be used as a treatment arm variable
}
\details{
A validate error is returned if the vector is not a factor with a more detailed
error message if any of the entries are empty strings
}
\keyword{internal}

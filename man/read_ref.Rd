% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_ref.R
\name{read_ref}
\alias{read_ref}
\title{Load a reference map}
\usage{
read_ref(MF.obj = NULL, ref_file = ref_file, sep = NULL, header = TRUE,
  na.strings = "NA", type = c("delim", "JoinMap"))
}
\arguments{
\item{MF.obj}{A mapfuser object}

\item{ref_file}{path to reference file}

\item{sep}{The field separator character, see read.delim}

\item{header}{A logical value indicating whether the files contains the names of variable int the first line, see read.delim()}

\item{na.strings}{How to interpret missing values? See read.delim}

\item{type}{Type of input data, either delimited file with columns "Marker", "LG", and "Position" or a JoinMap ".map" file.}
}
\value{
A mapfuser object with the reference map loaded to the ref_map slot. Name of the reference map is saved to the config.
}
\description{
Read a reference map, either a reference genetic map or a map with physical genome positions
}
\examples{
fpath <- system.file("extdata", package="mapfuser")
maps <- list.files(fpath, pattern = "Col", full.names = TRUE)
MF.obj <- read_maps(mapfiles = maps, sep = ",", header = TRUE,
mapweights = rep(1,7), type = "delim")
ref_file <- list.files(fpath, pattern = "reference", full.names = TRUE)
MF.obj <- read_ref(MF.obj = MF.obj, ref_file = ref_file, sep = ",",
header = TRUE, na.string = NA, type = "delim")
}
\author{
Dennis van Muijen
}

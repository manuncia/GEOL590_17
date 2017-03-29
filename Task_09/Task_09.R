library(roxygen2)
library(devtools)
library(testthat)
library(knitr)
library(dplyr)
install.packages("rstudioapi")

create("photosynthesis")
document()
setwd("..")
install("photosynthesis")

devtools::use_vignette("my-vignette")
devtools::load_all()
devtools::use_testthat()
devtools::test()
browseVignettes()

devtools::build_vignettes()

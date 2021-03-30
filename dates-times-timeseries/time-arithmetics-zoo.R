#' # Time arithmetics with "zoo" objects

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *zoo* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=zoo) using the code
#' `install.packages("zoo")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(zoo)

#' The file "zpresidents.RData" was created in an earlier example.

load("zpresidents.RData")

zpresidents_1 <- zpresidents[1:4]
zpresidents_2 <- zpresidents[3:6]
zpresidents_1 + zpresidents_2

presidents_1 <- presidents[1:4]
presidents_2 <- presidents[3:6]
presidents_1 + presidents_2

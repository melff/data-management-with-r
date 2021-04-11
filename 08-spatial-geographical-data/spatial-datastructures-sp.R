#' # The structure of objects of classes defined in the *sp* package

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *cshapes* and *sp* package. You may need to install them from
#' [CRAN](https://cran.r-project.org) using the code
#' `install.packages(c("cshapes","sp"))` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(cshapes)

cshape.sp <- cshp()

# Obtaining the data for the Gambia from the Cshapes data base
Gambia <- subset(cshape.sp,CNTRY_NAME=="The Gambia")

plot(Gambia)

class(Gambia)

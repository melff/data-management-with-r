#' # The structure of objects of classes defined in the *sp* package

#' The following makes use of the *sp* and *cshapes* packages. You may need to install them from
#' [CRAN](https://cran.r-project.org) using the code
#' `install.packages(c("sp"))` 
#' and `install.packages("https://cran.r-project.org/src/contrib/Archive/cshapes/cshapes_0.6.tar.gz",repos=NULL)`
#' if you want to run this on your computer. (These
#' packages are already installed on the notebook container, however.)
#' The latter code snippet installs an earlier version of *cshapes*, since the one on CRAN no longer supports *sp*.
#'

library(cshapes)

cshape.sp <- cshp()

# Obtaining the data for the Gambia from the Cshapes data base
Gambia <- subset(cshape.sp,CNTRY_NAME=="The Gambia")

plot(Gambia)

class(Gambia)

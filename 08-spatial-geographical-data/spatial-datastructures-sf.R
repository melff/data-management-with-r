#' # The structure of objects of classes defined in the *sf* package

#' The data used is available from the website of the [Upsala Conflict Data Program](https://ucdp.uu.se) as part of the zip file ["ged191-RData.zip"](https://ucdp.uu.se/downloads/ged/ged191-RData.zip).

unzip("ged191-RData.zip")
load("ged191.RData")

class(ged191)

# Number of observations
nrow(ged191)

# Number of variables
ncol(ged191)

#' The following makes use of the *sf* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=sf) using the code
#' `install.packages("sf")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.) 

library(sf)

options(width=140)
# Using the adapted 'print()' method from the 'sf' package for an extract of the data.
print(ged191[c(7:8,42)])

# Examining the structure of an "sf" object with 'str()'
str(ged191)

# Obtaining the geometry contained in 'ged191'
gged191 <- st_geometry(ged191)
gged191

# Accessing an individual shape
gged191[[1]]

# The class of a shape object
class(gged191[[1]])

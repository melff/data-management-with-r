#' # Properties of spatial objects

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following code makes use of two packages:
#' - the *sf* package, which is available from https://cran.r-project.org/package=sf
#' - the *units* package, which is available from https://cran.r-project.org/package=units
#' To run the code of this notebook you can install the packages by `install.packages(c("sf","units"))`. However, they are already installed in the container on which this example is run.
#'

library(sf)

#' The files "south-america-1990.RData" and "three-countries.RData" were created in a previous example.

load("south-america-1990.RData")
load("three-countries.RData")

st_area(Brazil)

in_km2 <- function(x) units::set_units(x,"km^2")
in_km2(st_area(Brazil))

in_km2(st_area(SthAmCountries))

structure(in_km2(st_area(SthAmCountries)),
          names=as.character(SthAmCountries$CNTRY_NAME))

st_distance(Brasilia,Bogota)

st_distance(Chile,Bogota)

# This takes a while, because R needs to figure out which points of the borders are the closest to one another
st_distance(Chile,Colombia)

in_km <- function(x) units::set_units(x,"km")
in_km(st_distance(Brasilia,Bogota))

in_km(st_distance(ThreeCapitals))

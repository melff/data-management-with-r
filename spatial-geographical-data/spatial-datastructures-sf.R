# The data used here is available from https://ucdp.uu.se/downloads/index.html#ged_global
unzip("ged191-RData.zip")
load("ged191.RData")

class(ged191)

# Number of observations
nrow(ged191)
# Number of variables
ncol(ged191)

# Using the adapted 'print()' method from the 'sf' package
library(sf)
ged191

# Examining the structure of an "sf" object with 'str()'
str(ged191)

# Obtaining the geometry contained in 'ged191'
gged191 <- st_geometry(ged191)
gged191

# Accessing an individual shape
gged191[[1]]

# The class of a shape object
class(gged191[[1]])

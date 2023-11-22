#' # Importing shapefiles

options(width=100)

#' The data used here are available from [Upsala Conflict Data Program](https://ucdp.uu.se/downloads/index.html#ged_polygons).

# To download the data, use the *R*-code 
#
# download.file("https://ucdp.uu.se/downloads/ged/ucdp-ged-poly-v-1-1-shape.zip",
#               "ucdp-ged-poly-v-1-1-shape.zip")

unzip("ucdp-ged-poly-v-1-1-shape.zip",list=TRUE)

unzip("ucdp-ged-poly-v-1-1-shape.zip",
      files=c(
          "UCDPGEDpoly.shx",
          "UCDPGEDpoly.shp",
          "UCDPGEDpoly.dbf"
          ))

#' The following code used to work with sf version 0.9.7 or sf version 1.0. However there now seem problems with some of backend libraries.

library(sf)
# All three of the following lines are equivalent:
# UCDPGEDpoly <- st_read("UCDPGEDpoly.shx") # for sf version <= 0.9.7
# UCDPGEDpoly <- st_read("UCDPGEDpoly.shp") # for sf version <= 0.9.7
# UCDPGEDpoly <- st_read("UCDPGEDpoly.dbf") # for sf version <= 0.9.7
UCDPGEDpoly <- read_sf("UCDPGEDpoly.shx") 
UCDPGEDpoly <- read_sf("UCDPGEDpoly.shp") 
UCDPGEDpoly <- read_sf("UCDPGEDpoly.dbf") 

str(UCDPGEDpoly)

print(UCDPGEDpoly[c(7,18,20)])

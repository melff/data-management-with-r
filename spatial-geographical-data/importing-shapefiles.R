# The data used here are available from https://ucdp.uu.se/downloads/index.html#ged_polygons
#download.file("https://ucdp.uu.se/downloads/ged/ucdp-ged-poly-v-1-1-shape.zip",
#              "ucdp-ged-poly-v-1-1-shape.zip")
unzip("ucdp-ged-poly-v-1-1-shape.zip",list=TRUE)

unzip("ucdp-ged-poly-v-1-1-shape.zip",
      files=c(
          "UCDPGEDpoly.shx",
          "UCDPGEDpoly.shp",
          "UCDPGEDpoly.dbf"
          ))

library(sf)
# All three of the following lines are equivalent:
UCDPGEDpoly <- st_read("UCDPGEDpoly.shx")
UCDPGEDpoly <- st_read("UCDPGEDpoly.shp")
UCDPGEDpoly <- st_read("UCDPGEDpoly.dbf")

UCDPGEDpoly

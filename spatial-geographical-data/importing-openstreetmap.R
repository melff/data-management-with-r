library(sf)
# The file used here was extracted by hand from http://www.openstreetmap.org
st_layers("stpauls.osm")

stpauls_lines <- st_read("stpauls.osm",layer="lines")
stpauls_polygons <- st_read("stpauls.osm",layer="multipolygons")

# Plotting the polygons ...
plot(st_geometry(stpauls_polygons),
     col="gray80",
     xlim=c(-0.1,-0.097),
     ylim=c(51.5135,51.514)
     )
# and adding the lines
plot(st_geometry(stpauls_lines),add=TRUE)

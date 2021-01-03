## Geographical projections of a mainland USA map (with apologies to Alaskans and Hawaiians)

load("US_flat.RData")
US_flat

plot(st_geometry(US_flat),
     graticule=TRUE,axes=TRUE)

bbox_US <- st_bbox(US_flat)

c(xcenter = mean(bbox_US[c("xmin","xmax")]),
  ycenter = mean(bbox_US[c("ymin","ymax")]))

laea <- st_crs("+proj=laea +lon_0=-95.8 +lat_0=37.3")
US_proj <- st_transform(US_flat,laea)
plot(st_geometry(US_proj),
     graticule=TRUE,axes=TRUE)

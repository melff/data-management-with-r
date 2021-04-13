#' # Converting "sp" objects to "sf" objects

#' The following makes use of the *sf*, *cshapes*, and *sp* packages. You may need to install them from
#' [CRAN](https://cran.r-project.org) using the code
#' `install.packages(c("sf","cshapes","sp"))` if you want to run this on your computer. (The
#' package is already installed in the notebook container, however.)

library(sf)

library(cshapes)

cshapes.1990 <- cshp(as.Date("1990-01-01"))
cshapes.1990 <- as(cshapes.1990,"sf")

options(width=200)
print(cshapes.1990[c(1:3,10)])

SthAmCntry.names <- c(
    "Argentina",
    "Bolivia",
    "Brazil",
    "Chile",
    "Colombia",
    "Ecuador",
    "Guyana",
    "Paraguay",
    "Peru",
    "Suriname",
    "Uruguay",
    "Venezuela")

SthAmCountries <-
    subset(cshapes.1990,
           CNTRY_NAME %in% SthAmCntry.names)

Brazil <- subset(cshapes.1990,CNTRY_NAME=="Brazil")
Chile <-  subset(cshapes.1990,CNTRY_NAME=="Chile")
Colombia <-  subset(cshapes.1990,CNTRY_NAME=="Colombia")

cap.latlong <- with(cshapes.1990,cbind(CAPLONG,CAPLAT))

cap.latlong <- lapply(1:nrow(cap.latlong),
                      function(i)cap.latlong[i,])

cap.latlong <- lapply(cap.latlong,st_point)
cap.latlong <- st_sfc(cap.latlong)

cshapes.capitals.1990 <- cshapes.1990
st_geometry(cshapes.capitals.1990) <- cap.latlong

st_crs(cshapes.capitals.1990) <- st_crs(cshapes.1990)

print(cshapes.capitals.1990[c(1:3,10)])

Brasilia <- subset(cshapes.capitals.1990,CNTRY_NAME=="Brazil")
Santiago <-  subset(cshapes.capitals.1990,CNTRY_NAME=="Chile")
Bogota <-  subset(cshapes.capitals.1990,CNTRY_NAME=="Colombia")

graypal <- function(n)gray.colors(n,start=.2,end=.9,alpha=.5)
plot(SthAmCountries,pal=graypal)

plot(st_geometry(SthAmCountries))

plot(st_geometry(Brazil))

save(cshapes.1990,cshapes.capitals.1990,file="cshapes-1990.RData")
save(Brazil,Chile,Colombia,
     Brasilia,Santiago,Bogota,
     SthAmCountries,
     file="south-america-1990.RData")

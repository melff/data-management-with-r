library(sf)

load("south-america-1990.RData")
load("ged191.RData")
load("cshapes-1990.RData")

ged191_ellips <- st_transform(ged191,st_crs(cshapes.1990))

# Civilian deaths per country
aggregate(ged191_ellips["deaths_civilians"],by=SthAmCountries,sum)

# Civilian deaths per country, with country names
within(
    aggregate(ged191_ellips["deaths_civilians"],by=SthAmCountries,sum),
    country <- SthAmCountries$CNTRY_NAME)

st_circ <- function(x,dist.km){
    dist.degr <- 360*dist.km/40007.863
    st_buffer(st_geometry(x),dist=dist.degr)
}

Bogota.region <- st_circ(Bogota,dist.km=200)
Colombia.rest <- st_difference(st_geometry(Colombia),Bogota.region)

# Civilian deaths in the Bogota region and the rest of Colombia
aggregate(ged191_ellips["deaths_civilians"],
          by=c(Bogota.region,Colombia.rest),
          sum)

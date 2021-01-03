library(sf)
library(cshapes)

load("south-america-1990.RData")

st_contains(Brazil,Brasilia,sparse=FALSE)
st_contains(Brazil,Bogota,sparse=FALSE)

ThreeCountries <-
    subset(cshapes.1990,
           CNTRY_NAME %in% c("Brazil","Chile","Colombia"))
rownames(ThreeCountries) <- ThreeCountries$CNTRY_NAME
ThreeCapitals <-
    subset(cshapes.capitals.1990,
           CNTRY_NAME %in% c("Brazil","Chile","Colombia"))
rownames(ThreeCapitals) <- ThreeCapitals$CAPNAME
st_contains(ThreeCountries,ThreeCapitals,sparse=FALSE)

structure(
   st_contains(ThreeCountries,ThreeCapitals,sparse=FALSE),
   dimnames=list(rownames(ThreeCountries),rownames(ThreeCapitals))
)

st_touches(Brazil,Colombia,sparse=FALSE)
st_touches(Brazil,Chile,sparse=FALSE)

structure(
   st_touches(ThreeCountries,sparse=FALSE),
   dimnames=list(rownames(ThreeCountries),rownames(ThreeCountries))
)

save(ThreeCountries,ThreeCapitals,file="three-countries.RData")

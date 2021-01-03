st_area(Brazil)

in_km2 <- function(x) units::set_units(x,"km^2")
in_km2(st_area(Brazil))

in_km2(st_area(SthAmCountries))

structure(in_km2(st_area(SthAmCountries)),
          names=as.character(SthAmCountries$CNTRY_NAME))

st_distance(Brasilia,Bogota)

st_distance(Chile,Bogota)

st_distance(Chile,Colombia)

in_km <- function(x) units::set_units(x,"km")
in_km(st_distance(Brasilia,Bogota))

in_km(st_distance(ThreeCapitals))

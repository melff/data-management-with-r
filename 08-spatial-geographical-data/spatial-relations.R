#' # Spatial relations

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *sf* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=sf) using the code
#' `install.packages("sf")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(sf)

#' The file `"south-america-1990.RData"` loaded below was created in a previous example was created in a previous example.

load("south-america-1990.RData")

plot_g <- function(x,...) plot(st_geometry(x),...)
plot_g(Brazil)
plot_g(Brasilia,add=TRUE,pch=19) # Circle
plot_g(Bogota,add=TRUE,pch=15) # Square

st_contains(Brazil,Brasilia,sparse=FALSE)

st_contains(Brazil,Bogota,sparse=FALSE)

load("cshapes-1990.RData")
ThreeCountries <-
    subset(cshapes.1990,
           CNTRY_NAME %in% c("Brazil","Chile","Colombia"))
rownames(ThreeCountries) <- ThreeCountries$CNTRY_NAME

ThreeCapitals <-
    subset(cshapes.capitals.1990,
           CNTRY_NAME %in% c("Brazil","Chile","Colombia"))
rownames(ThreeCapitals) <- ThreeCapitals$CAPNAME

plot_g(ThreeCountries)
plot_g(ThreeCapitals,add=TRUE,pch=19)

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

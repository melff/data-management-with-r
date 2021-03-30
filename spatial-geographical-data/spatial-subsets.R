#' # Subsetting spatial feature objects

#+ slideshow={'slide_type': '-'}
options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *sf* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=sf) using the code
#' `install.packages("sf")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

#+ slideshow={'slide_type': '-'}
library(sf)

#' The files "south-america-1990.RData" and "ged191.RData" were created in previous examples.

#+ slideshow={'slide_type': '-'}
load("south-america-1990.RData")
load("ged191.RData")

#+ slideshow={'slide_type': '-'}
# This fails due to different coordinate reference systems
Colombia.conflicts <- ged191[Colombia,]

#+ slideshow={'slide_type': '-'}
st_crs(Colombia)

#+ slideshow={'slide_type': '-'}
st_crs(ged191)

#+ slideshow={'slide_type': '-'}
# Here we make sure that the coordinate reference systems match
ged191_ellips <- st_transform(ged191,st_crs(Colombia))
Colombia.conflicts <- ged191_ellips[Colombia,]

#+ slideshow={'slide_type': '-'}
mypal <- function(n)gray.colors(n,start=.2,end=.9,alpha=.5)
plot(st_geometry(Colombia))
plot(Colombia.conflicts["deaths_civilians"],
     add=TRUE,pch=19,cex=.2,
     pal=mypal,
     nbreaks=30
     )

#+ slideshow={'slide_type': '-'}
st_circ <- function(x,dist.km){
    dist.degr <- 360*dist.km/40007.863
    st_buffer(st_geometry(x),dist=dist.degr)
}

#+ slideshow={'slide_type': '-'}
Bogota.200km <- st_circ(Bogota,dist.km=200)

#+ slideshow={'slide_type': '-'}
Bogota.conflicts <- ged191_ellips[Bogota.200km,]

#+ slideshow={'slide_type': '-'}
plot(st_geometry(Colombia))
plot(st_geometry(Colombia.conflicts),
     add=TRUE,pch=1,cex=.3,col="gray80"
     )
plot(st_geometry(Bogota.conflicts),
     add=TRUE,pch=19,cex=.3)
plot(Bogota.200km,lty=3,add=TRUE)

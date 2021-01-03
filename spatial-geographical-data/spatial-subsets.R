library(sf)

load("south-america-1990.RData")
load("ged191.RData")

# This fails due to different coordinate reference systems
Colombia.conflicts <- ged191[Colombia,]

st_crs(Colombia)
st_crs(ged191)

# Here we make sure that the coordinate reference systems match
ged191_ellips <- st_transform(ged191,st_crs(Colombia))
Colombia.conflicts <- ged191_ellips[Colombia,]

mypal <- function(n)gray.colors(n,start=.2,end=.9,alpha=.5)
plot(st_geometry(Colombia))
plot(Colombia.conflicts["deaths_civilians"],
     add=TRUE,pch=19,cex=.2,
     pal=mypal,
     nbreaks=30
     )

st_circ <- function(x,dist.km){
    dist.degr <- 360*dist.km/40007.863
    st_buffer(st_geometry(x),dist=dist.degr)
}

Bogota.200km <- st_circ(Bogota,dist.km=200)

Bogota.conflicts <- ged191_ellips[Bogota.200km,]

plot(st_geometry(Colombia))
plot(st_geometry(Colombia.conflicts),
     add=TRUE,pch=1,cex=.3,col="gray80"
     )
plot(st_geometry(Bogota.conflicts),
     add=TRUE,pch=19,cex=.3)
plot(Bogota.200km,lty=3,add=TRUE)

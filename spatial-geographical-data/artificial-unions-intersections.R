library(sf)
A <- rbind(
    c(0,0),
    c(2,0),
    c(0,2),
    c(0,0)
)
A <- st_polygon(list(A))
B <- rbind(
    c( 1, 1),
    c( 1,-1),
    c(-1,-1),
    c(-1, 1),
    c( 1, 1)
)
B <- st_polygon(list(B))

op <- par(mai=c(0,0,0,0),mfrow=c(1,3),xpd=NA)
plot(A,xlim=c(-1,2),ylim=c(-1,2))
plot(B,lty=2,add=TRUE)
text(0,1.5,"A",pos=2)
text(1,-.5,"B",pos=4)
text(.5,-1.5,"Two shapes A and B",pos=1)
plot(st_union(A,B),col="gray70",xlim=c(-1,2),ylim=c(-1,2))
plot(A,lty=3,add=TRUE)
plot(B,lty=3,add=TRUE)
text(.5,-1.5,"st_union(A,B)",pos=1)
plot(A,lty=3,xlim=c(-1,2),ylim=c(-1,2))
plot(B,lty=3,add=TRUE)
plot(st_intersection(A,B),add=TRUE,col="gray70")
text(.5,-1.5,"st_intersection(A,B)",pos=1)
par(op)

op <- par(mai=c(0,0,0,0),mfrow=c(1,3),xpd=NA)
plot(st_difference(A,B),col="gray70",,xlim=c(-1,2),ylim=c(-1,2))
plot(A,lty=3,add=TRUE)
plot(B,lty=3,add=TRUE)
text(.5,-1.5,"st_difference(A,B)",pos=1)
plot(st_difference(B,A),col="gray70",,xlim=c(-1,2),ylim=c(-1,2))
plot(A,lty=3,add=TRUE)
plot(B,lty=3,add=TRUE)
text(.5,-1.5,"st_difference(B,A)",pos=1)
plot(st_sym_difference(A,B),col="gray70",,xlim=c(-1,2),ylim=c(-1,2))
text(.5,-1.5,"st_sym_difference(A,B)",pos=1)
par(op)

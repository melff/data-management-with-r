library(zoo)
load("zpresidents.RData")

zpresidents.o <- na.omit(zpresidents)

zpresidents.o8 <- zpresidents.o[1:8]
rollmean(zpresidents.o8,k=7)
rollmean(zpresidents.o8,k=7,align="left")
rollmean(zpresidents.o8,k=7,align="right")

zpresidents.s <- na.spline(zpresidents)
plot(zpresidents.s,lty=3)
zpresidents.m <- rollmean(zpresidents.s,k=9)
lines(zpresidents.m,lwd=2)

zpresidents.sd <- rollapply(zpresidents.s,
                            width=9,
                            FUN=sd)

tv <- qt(.975,df=8)
zpresidents.u <- zpresidents.m+tv*zpresidents.sd/sqrt(8)
zpresidents.l <- zpresidents.m-tv*zpresidents.sd/sqrt(8)

plot(zpresidents.m,ylim=c(20,80))
lines(zpresidents.u,lty=2)
lines(zpresidents.l,lty=2)

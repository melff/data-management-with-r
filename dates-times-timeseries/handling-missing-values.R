library(zoo)
load("zpresidents.RData")

# Leads to an error:
presidents.o <- na.omit(presidents)

zpresidents.o <- na.omit(zpresidents)
c("Original length" = length(zpresidents),
  "Length after dropping NAs"  = length(zpresidents.o))

plot(zpresidents,lty=3)
lines(na.contiguous(zpresidents),lwd=2)

plot(zpresidents,lwd=2)
lines(na.approx(zpresidents),lty=2)
lines(na.spline(zpresidents),lty=3)

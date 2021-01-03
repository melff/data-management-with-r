library(cshapes)
cshape.sp <- cshp()
# Obtaining the data for the Gambia from the Cshapes data base
Gambia <- subset(cshape.sp,CNTRY_NAME=="The Gambia")

plot(Gambia)

class(Gambia)

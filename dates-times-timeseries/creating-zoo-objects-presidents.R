npresidents <- as.numeric(presidents)
library(zoo)
years <- 1945:1974
quarters <- 1:4
presi.times <- yearqtr(
    rep(years,each=4) +  # each year is repeated 4 times
    rep((quarters-1)/4,30) # the quarters are repeated 30 times
)
zpresidents <- zoo(npresidents,order.by=presi.times)
zpresidents
str(zpresidents)

coredata(zpresidents)[1:15] # To save space we only look at the
index(zpresidents)[1:15]    # first 15 elements.
time(zpresidents)[1:15]

zpresidents[1:8]

# Saved for later use:
save(zpresidents,file="zpresidents.RData")

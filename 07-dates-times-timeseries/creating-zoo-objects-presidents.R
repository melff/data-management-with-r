#' # Creating a "zoo" object from the `presidents` time series

#' `presidents` is already available as part of a standard *R* installation.

npresidents <- as.numeric(presidents)

#' The following makes use of the *zoo* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=zoo) using the code
#' `install.packages("zoo")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

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

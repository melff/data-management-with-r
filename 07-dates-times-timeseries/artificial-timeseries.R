#' # Artificial time series data

x <- round(rnorm(1:12),1)

ts(x,start=2000,
   frequency=4)

print(ts(x,start=2000,
       frequency=12))

#' The data file ["unemployment.csv"](https://github.com/melff/dataman-r/raw/main/07-dates-times-timeseries/OECD-unemployment.R) used below consists of data originally downloaded from the [OECD Database website](https://data.oecd.org).

unemployment <- read.csv("unemployment.csv")
# This is of course incorrect, but demonstrates how monthly multivariate time 
# series can be constructed from scratch.
ts(unemployment[2:5],
   start = 1970,
   frequency=4)

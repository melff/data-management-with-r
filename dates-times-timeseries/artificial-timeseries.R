x <- round(rnorm(1:12),1)

ts(x,start=2000,
   frequency=4)

ts(x,start=2000,
   frequency=12)

unemployment <- read.csv("unemployment.csv")
# This is of course incorrect, but demonstrates how monthly multivariate time 
# series can be constructed from scratch.
ts(unemployment[2:5],
   start = 1970,
   frequency=4)

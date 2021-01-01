t0 <- as.POSIXlt(0,origin="2020-02-01",tz="GMT")

(t1 <- as.POSIXlt(t0 + 3630))

# Get the seconds component of the time point
t1$sec

# Get the minutes component of the time point
t1$min

# Get the hours component
t1$hour

# Get the day(s) of the month
t1$mday

# Get the (numeric) month
t1$mon

# Get the (numeric) year
t1$year

# Get the (numeric) day of the week
t1$wday

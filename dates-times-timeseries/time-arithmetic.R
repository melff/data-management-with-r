# When in standard format, a string does not need a format spefication in order
# to be translatable
t0 <- as.POSIXct("2020-02-01 00:00",tz="GMT")
t0
# Adding 3600 seconds means adding an hour:
t0 + 3600
# Subtracting seconds may also change the date:
t0 - 1
# A day is 24 times 3600 seconds
day <- 24*3600
t0 + day
# Recycling also works, so we can create a week:
t0 + 1:7*day

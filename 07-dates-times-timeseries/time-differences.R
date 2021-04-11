#' # Time differences

options(jupyter.rich_display=FALSE) # Create output as usual in R

# It does not matter whether we have "POSIXct" or "POSIXlt" objects,
# we can always obtain differences between the tiems
t0 <- as.POSIXlt(0,origin="2020-02-01",tz="GMT")
t1 <- as.POSIXct(0,origin="2020-02-01 3:00",tz="GMT")
t2 <- as.POSIXlt(0,origin="2020-02-01 3:45",tz="GMT")
t3 <- as.POSIXct(0,origin="2020-02-01 3:45:06",tz="GMT")

# The unit of measurement for time differences is selected
# automatically. Usually it is the largest sensible unit:
t1 - t0

t2 - t1

t3 - t2

t3 - t0

# The last difference is in hours and hour fractions. It might be more sensible
# to have seconds as units of measuremnt.
diff.t <- t3 - t0
units(diff.t) <- "secs"
diff.t

# It is also possible to compute differences between dates:
d0 <- as.Date("2020-01-31")
d1 <- as.Date("2020-02-28")
d2 <- as.Date("2020-03-31")

# Usually the difference is in days:
d1 - d0

d2 - d0

# We may also want to see the difference in hours:
diff.d <- d1 - d0
units(diff.d) <- "hours"
diff.d

# It is also possible to create time durations from scratch
# From strings:
as.difftime("0:30:00")

# and from numbers, here it is necessary to specify the unit of measurement
as.difftime(30, units="mins")

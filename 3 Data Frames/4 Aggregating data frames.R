# In the following we aggregate data from the British Election Study 2010

load("Data/bes2010feelings.RData")

# Here we obtain the average affects towards the major three parties, using an
# 'old-style' call of the function 'aggregate()'
Mean <- function(x,...)mean(x,...,na.rm=TRUE)
aggregate(bes2010feelings[c("flng.brown","flng.cameron",
                            "flng.clegg","flng.salmond")],
          with(bes2010feelings,
               list(Region=region,Wave=wave)),
          Mean)

# More recent versions of R also provide a slightly more convenient way of
# calling 'aggregate()' using a formula argument:
aggregate(cbind(flng.brown,
                flng.cameron,
                flng.clegg,
                flng.salmond
                )~region+wave,
          data=bes2010feelings,
          Mean)

# The 'memisc' package has a somewhat more flexible variant of 'aggregate()'
# It is possbile to reproduce the results of 'aggregate'
library(memisc)
Aggregate(c(Brown=Mean(flng.brown),
            Cameron=Mean(flng.cameron),
            Clegg=Mean(flng.clegg),
            Salmond=Mean(flng.salmond))~region+wave,
            data=bes2010feelings)

# However it also allows to used different summary functions.
Var <- function(x,...) var(x,...,na.rm=TRUE)
Aggregate(c(Mean(flng.brown),Var(flng.brown))~region+wave,
          data=bes2010feelings)


load("bes2010feelings-pre-long.RData")

# Here we use 'order()' 

ii <- with(bes2010flngs_pre_long,order(id,party))

bes2010flngs_pre_long_sorted <- bes2010flngs_pre_long[ii,]
head(bes2010flngs_pre_long_sorted[c("party","id",
                                    "flng.leaders","flng.parties")],
     n=15)

# Some more convenient altarnatives:
# Using a 'Sort()' function:

Sort <- function(data,...){
    ii <- eval(substitute(order(...)),
                          envir=data,
                          enclos=parent.frame())
    data[ii,]
}

bes2010flngs_pre_long_sorted <- Sort(bes2010flngs_pre_long,
                                     id,party)

# Using the 'sort()' method function from the 'memisc' package:
library(memisc)
bes2010flngs_pre_long_sorted <- sort(bes2010flngs_pre_long,
                                     by=~party+id)
head(bes2010flngs_pre_long_sorted[c("party","id",
                                    "flng.leaders","flng.parties")],
     n=15)



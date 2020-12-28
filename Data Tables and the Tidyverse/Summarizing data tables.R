load("bes2010feelings.RData")
library(data.table)
setDT(bes2010feelings)

Mean <- function(x) mean(x,na.rm=TRUE)
bes2010feelings[,.(Brown=Mean(flng.brown),
                   Cameron=Mean(flng.cameron),
                   Clegg=Mean(flng.clegg),
                   N=.N)]

bes2010feelings[,.(Brown=Mean(flng.brown),
                   Cameron=Mean(flng.cameron),
                   Clegg=Mean(flng.clegg),
                   N=.N),
                by=.(wave,region)]

#' # Summarizing data tables

#' Here we use data from the British Election Study 2010. The data set
#' [bes2010feelings.RData](https://github.com/melff/dataman-r/raw/main/data-frames/bes2010feelings.RData)
#' is prepared from the original available at
#' https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by
#' removing identifying information and scrambling the data.

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

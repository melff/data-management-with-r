#' # Sorting data frames

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' Here we use data from the British Election Study. The data set [bes2010feelings-pre-long.RData](https://github.com/melff/dataman-r/raw/main/data-frames/bes2010feelings-pre-long.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings-pre-long.RData")

#' Here we use `order()`

ii <- with(bes2010flngs_pre_long,order(id,party))
bes2010flngs_pre_long_sorted <- bes2010flngs_pre_long[ii,]

head(bes2010flngs_pre_long_sorted[c("party","id",
                                    "flng.leaders","flng.parties")],n=15)

#' Some more convenient altarnatives:
#' Using a `Sort()` function:

Sort <- function(data,...){
    ii <- eval(substitute(order(...)),
                          envir=data,
                          enclos=parent.frame())
    data[ii,]
}

bes2010flngs_pre_long_sorted <- Sort(bes2010flngs_pre_long,
                                     id,party)

#' There is a `sort()` method function provided by the *memisc* package, which makes sorting a data frame a bit easier. You may need to install this package using `install.packages("memisc")` from 
#' [CRAN](https://cran.r-project.org/package=memisc) if you want to run this on your computer. (The package is already installed on the notebook container, however.)

library(memisc)

bes2010flngs_pre_long_sorted <- sort(bes2010flngs_pre_long,
                                     by=~party+id)

head(bes2010flngs_pre_long_sorted[c("party","id",
                                    "flng.leaders","flng.parties")],n=15)



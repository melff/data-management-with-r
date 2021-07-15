#' # Groupwise computations within data frames

#' Here we use data from the British Election Study 2010. The data set [bes2010feelings-pre-long.RData](https://github.com/melff/dataman-r/raw/main/03-data-frames/bes2010feelings-pre-long.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings-pre-long.RData")

#' Groupwise computations using `split()`:

bes2010flngs_pre_long.splt <- split(bes2010flngs_pre_long,
                                    bes2010flngs_pre_long$id)

str(bes2010flngs_pre_long.splt[[1]])

Mean <- function(x,...) mean(x,...,na.rm=TRUE)

bes2010flngs_pre_long.splt <- lapply(
    bes2010flngs_pre_long.splt,
    within,expr={
        rel.flng.parties <- flng.parties - Mean(flng.parties)
        rel.flng.leaders <- flng.leaders - Mean(flng.leaders)
    })

str(bes2010flngs_pre_long.splt[[1]])

bes2010flngs_pre_long <- unsplit(bes2010flngs_pre_long.splt,
                                 bes2010flngs_pre_long$id)
str(bes2010flngs_pre_long)

#' Groupwise computations using `withinGroups()` from the package *memisc*. You may need to install this package using `install.packages("memisc")` from 
#' [CRAN](https://cran.r-project.org/package=memisc) if you want to run this on your computer. (The package is already installed on the notebook container, however.)

library(memisc)

bes2010flngs_pre_long <- withinGroups(bes2010flngs_pre_long,
                                      ~id,{
     rel.flng.parties <- flng.parties - Mean(flng.parties)
     rel.flng.leaders <- flng.leaders - Mean(flng.leaders)
    })

#' We use 'head' to look at the first 14 elements of the re-combined data frame:

head(bes2010flngs_pre_long[-(1:2)],n=14)

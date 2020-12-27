load("bes2010feelings-pre-long.RData")
## Groupwise computations using 'split()' ##############################################

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

## Groupwise computations using 'withinGroups()' #######################################

library(memisc)

Mean <- function(x,...) mean(x,...,na.rm=TRUE)
bes2010flngs_pre_long <- withinGroups(bes2010flngs_pre_long,
                                      ~id,{
     rel.flng.parties <- flng.parties - Mean(flng.parties)
     rel.flng.leaders <- flng.leaders - Mean(flng.leaders)
    })
# We use 'head' to look at the first 14 elements of the re-combined data frame
head(bes2010flngs_pre_long[-(1:2)],n=14)

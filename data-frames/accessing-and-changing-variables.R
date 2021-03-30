#' # Accessing and changing variables

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' Here we use data from the British Election Study 2010. The data set [bes2010feelings-prepost.RData](https://github.com/melff/dataman-r/raw/main/data-frames/bes2010feelings-prepost.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings-prepost.RData")

#' ## `with()` versus `attach()`

c(
    Brown   = mean(bes2010flngs_pre$flng.brown,na.rm=TRUE),
    Cameron = mean(bes2010flngs_pre$flng.cameron,na.rm=TRUE),
    Clegg   = mean(bes2010flngs_pre$flng.clegg,na.rm=TRUE),
    Salmond = mean(bes2010flngs_pre$flng.salmond,na.rm=TRUE),
    Jones   = mean(bes2010flngs_pre$flng.jones,na.rm=TRUE)
)

## Here we define a convenience function.
Mean <- function(x,...) mean(x,na.rm=TRUE,...)

## Use of 'attach'

# The following code shows how the use of 'attach' can lead to confusion
attach(bes2010flngs_pre)
c(
    Brown   = Mean(flng.brown),
    Cameron = Mean(flng.cameron),
    Clegg   = Mean(flng.clegg),
    Salmond = Mean(flng.salmond),
    Jones   = Mean(flng.jones)
)

attach(bes2010flngs_post)
c(
    Brown   = Mean(flng.brown),
    Cameron = Mean(flng.cameron),
    Clegg   = Mean(flng.clegg),
    Salmond = Mean(flng.salmond),
    Jones   = Mean(flng.jones)
)

detach(bes2010flngs_post)

c(
    Brown   = Mean(flng.brown),
    Cameron = Mean(flng.cameron),
    Clegg   = Mean(flng.clegg),
    Salmond = Mean(flng.salmond),
    Jones   = Mean(flng.jones)
)

detach(bes2010flngs_pre)

# 'with()' is a better alternative, because it is clear where the data in the varialbes come from:

with(bes2010flngs_pre,c(
    Brown   = Mean(flng.brown),
    Cameron = Mean(flng.cameron),
    Clegg   = Mean(flng.clegg),
    Salmond = Mean(flng.salmond),
    Jones   = Mean(flng.jones)
))

with(bes2010flngs_post,c(
    Brown   = Mean(flng.brown),
    Cameron = Mean(flng.cameron),
    Clegg   = Mean(flng.clegg),
    Salmond = Mean(flng.salmond),
    Jones   = Mean(flng.jones)
))

#' ## Changing variables within a data frame 

bes2010flngs_pre <- within(bes2010flngs_pre,{
    ave_flng <- (flng.brown + flng.cameron + flng.clegg)/3
    rel_flng.brown   <- flng.brown - ave_flng
    rel_flng.cameron <- flng.cameron - ave_flng
    rel_flng.clegg   <- flng.clegg - ave_flng
})

with(bes2010flngs_pre,c(
    Brown   = Mean(rel_flng.brown),
    Cameron = Mean(rel_flng.cameron),
    Clegg   = Mean(rel_flng.clegg)
))

# It is also possible without 'within()' but this is terribly tedious:
bes2010flngs_pre$ave_flng <- (bes2010flngs_pre$flng.brown +
                              bes2010flngs_pre$flng.cameron +
                              bes2010flngs_pre$flng.clegg)/3
bes2010flngs_pre$rel_flng.brown   <- (bes2010flngs_pre$flng.brown
                                      - bes2010flngs_pre$ave_flng)
bes2010flngs_pre$rel_flng.cameron <- (bes2010flngs_pre$flng.cameron
                                      - bes2010flngs_pre$ave_flng)
bes2010flngs_pre$rel_flng.clegg   <- (bes2010flngs_pre$flng.clegg
                                      - bes2010flngs_pre$ave_flng)

with(bes2010flngs_pre,c(
    Brown   = Mean(rel_flng.brown),
    Cameron = Mean(rel_flng.cameron),
    Clegg   = Mean(rel_flng.clegg)
))

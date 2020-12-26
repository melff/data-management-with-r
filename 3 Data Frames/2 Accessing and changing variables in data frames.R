load("Data/bes2010feelings-prepost.RData")

c(
    Brown   = mean(bes2010flngs_pre$flng.brown,na.rm=TRUE),
    Cameron = mean(bes2010flngs_pre$flng.cameron,na.rm=TRUE),
    Clegg   = mean(bes2010flngs_pre$flng.clegg,na.rm=TRUE),
    Salmond = mean(bes2010flngs_pre$flng.salmond,na.rm=TRUE),
    Jones   = mean(bes2010flngs_pre$flng.jones,na.rm=TRUE)
)


## Use of 'attach'
Mean <- function(x,...) mean(x,na.rm=TRUE,...)
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

## Changing variables within a data frame #################################################

bes2010flngs_pre <- within(bes2010flngs_pre,{
    ave_flng <- (flng.brown + flng.cameron + flng.clegg)/3
    rel_flng.brown   <- flng.brown - ave_flng
    rel_flng.cameron <- flng.cameron - ave_flng
    rel_flng.clegg   <- flng.clegg - ave_flng
})

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

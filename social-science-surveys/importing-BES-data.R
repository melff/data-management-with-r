## Preparing Data from the 1983 British Election Study ##############################################
## (Note that the data must be downloaded from a different website.)

library(memisc) # The functions used here are in this package.
# The first step: Optainin the location and description of the survey data file
BES.1983.por <- spss.portable.file("83BES.sav")
description(BES.1983.por)

# The second step: Loading a subset of the data - only the variables that are
# really needed for the analysis.
BES.1983.classvot <- subset(
    BES.1983.por,
    select=c(
        voted          = Q7A,
        vote           = Q9A,
        lrself         = Q46G,
        fglclass       = FGLCLASS,
        rglclass       = RGLCLASS,
        sglclass       = SGLCLASS,
        ethnicity      = Q64A,
        gender         = Q64B,
        age            = Q56,
        educ           = Q59A,
        religion       = Q63A,
        religatt       = Q63B
    ))
description(BES.1983.classvot)

# Declaring the measurement level of a single variable
measurement(BES.1983.classvot$lrself) <- "interval"

# Declaring the measurement level of several variables
BES.1983.classvot <- within(BES.1983.classvot,{
   measurement(lrself) <- "interval"
   measurement(age) <- "interval"
   measurement(educ) <- "interval"
})

# Declaring the measurement level of several variables using a loop
BES.1983.classvot <- within(BES.1983.classvot,{
   foreach(var=c(lrself,age,educ),{
           measurement(var) <- "interval"
   })
})

# Obtaining the codebook a single variable
codebook(BES.1983.classvot["age"])

# Declaring the missing values for this variable
missing.values(BES.1983.classvot$age) <- 99

# Declaring several missing values

BES.1983.classvot <- within(BES.1983.classvot,{
    missing.values(voted)     <- 9
    missing.values(vote)      <- 95:99
    missing.values(lrself)    <- 95:99
    missing.values(fglclass)  <- 0
    missing.values(rglclass)  <- 0
    missing.values(sglclass)  <- 0
    missing.values(ethnicity) <- 9
    missing.values(gender)    <- 9
    missing.values(age)       <- 9
    missing.values(age)       <- 98:99
    missing.values(religion)  <- 99
    missing.values(religatt)  <- 7:9
})

# The codebook of the resulting data set object
codebook(BES.1983.classvot)

save(BES.1983.classvot,
     file="BES-1983-classvot.RData")

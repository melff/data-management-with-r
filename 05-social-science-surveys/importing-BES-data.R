#' # Importing data from the British Election Study in SPSS format

#' In order to run this notebook successfully, you have to download the 1983 British Election Study from the [BES website](https://www.britishelectionstudy.com/data-object/1983-bes-cross-section/) and upload it to the virtual machine on which this notebook runs. To do this, 
#'
#' 1. pull down the "File" menu item and select "Open"
#' 2. An overview of the folder that contains the notebook opens. 
#' 3. The folder view has a button labelled "Upload". Use this to upload the file that you downloaded from the BES website. Its name should be `83BES.sav`.
#'
#' Note that the uploaded data will disappear, when the notebook container is reset.
#'
#' The following also makes use of the *memisc* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=memisc) using the code
#' `install.packages("memisc")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

library(memisc) # The functions used here are in this package.

# The first step: Optainin the location and description of the survey data file
BES.1983.por <- spss.portable.file("83BES.sav")

description(BES.1983.por[1:30])

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

options(jupyter.rich_display=TRUE)
show_html(codebook(BES.1983.classvot)) # Same information in HTML format

save(BES.1983.classvot,
     file="BES-1983-classvot.RData")

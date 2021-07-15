#' # Importing data into data frames

#' This notebook makes use of the following files:
#'
#' - [ConstituencyResults2010.csv](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.csv)
#' - [ConstituencyResults2010-nohdr.csv](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010-nohdr.csv)
#' - [ConstituencyResults2010.tsv](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.tsv)
#' - [ConstituencyResults2010.sav](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.sav)
#' - [ConstituencyResults2010.por](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.por)
#' - [ConstituencyResults2010.dta](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.dta)
#' - [ConstituencyResults2010-stata-new.dta](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstResults2010-stata-new.dta)
#'
#' Currently, these Data files are also available from https://www.pippanorris.com/data.
#' (Previously they were available from http://www.hks.harvard.edu/fs/pnorris/Data/Data.htm.) 
#'

#' ## Importing data from text files

#' Importing CSV data:

# We inspect the text file using 'readLines()'
readLines("ConstituencyResults2010.csv",n=5)

# For the actual import we use 'read.csv()'
ConstRes2010 <- read.csv("ConstituencyResults2010.csv")
ConstRes2010[1:5,]

# A CSV file without a variable name header
readLines("ConstituencyResults2010-nohdr.csv",n=5)

ConstRes2010 <- read.csv("ConstituencyResults2010-nohdr.csv",
                         header=FALSE)
ConstRes2010[1:5,]

# Importing tab-delimited data:
readLines("ConstituencyResults2010.tsv",n=5)

ConstRes2010 <- read.delim("ConstituencyResults2010.tsv")
ConstRes2010[1:5,]

#' Importing fixed-width data:

readLines("ConstituencyResults2010-fwf.txt",n=5)

ConstRes2010 <- read.fwf("ConstituencyResults2010-fwf.txt",
                         widths=c(3,4,4,4,4,4,4,4,4))
ConstRes2010[1:5,]

#' ## Importing data from other statistics packages
#' Importing data using the *foreign* package

library(foreign)

# An SPSS 'system' file
ConstRes2010 <- read.spss("ConstituencyResults2010.sav",
                          to.data.frame=TRUE)
ConstRes2010[1:5,]

# An SPSS 'portable' file
ConstRes2010 <- read.spss("ConstituencyResults2010.por",
                          to.data.frame=TRUE)
ConstRes2010[1:5,]

# A Stata file
ConstRes2010 <- read.dta("ConstituencyResults2010.dta")
ConstRes2010[1:5,]

# The following does not work - newer Stata format is not supported
ConstRes2010 <- read.dta("ConstResults2010-stata-new.dta")

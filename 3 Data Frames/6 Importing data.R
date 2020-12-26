## Importing data from text files #####################################################

# Importing CSV data:
# We inspect the text file using 'readLines()'

readLines("Data/ConstituencyResults2010.csv",n=5)

# For the actual import we use 'read.csv()'

ConstRes2010 <- read.csv("Data/ConstituencyResults2010.csv")
ConstRes2010[1:5,]

# A CSV file without a variable name header

readLines("Data/ConstituencyResults2010-nohdr.csv",n=5)

ConstRes2010 <- read.csv("Data/ConstituencyResults2010-nohdr.csv",
                         header=FALSE)
ConstRes2010[1:5,]

# Importing tab-delimited data:

readLines("Data/ConstituencyResults2010.tsv",n=5)

ConstRes2010 <- read.delim("Data/ConstituencyResults2010.tsv")
ConstRes2010[1:5,]


## Importing fixed-width data:

readLines("Data/ConstituencyResults2010-fwf.txt",n=5)

ConstRes2010 <- read.fwf("Data/ConstituencyResults2010-fwf.txt",
                         widths=c(3,4,4,4,4,4,4,4,4))


## Importing data from other statistics packages ####################################

# Importing data using the 'foreign' package

library(foreign)

# An SPSS 'system' file
ConstRes2010 <- read.spss("Data/ConstituencyResults2010.sav",
                          to.data.frame=TRUE)
ConstRes2010[1:5,]

# An SPSS 'portable' file
ConstRes2010 <- read.spss("Data/ConstituencyResults2010.por",
                          to.data.frame=TRUE)
ConstRes2010[1:5,]

# A Stata file
ConstRes2010 <- read.dta("Data/ConstituencyResults2010.dta")
ConstRes2010[1:5,]

# The following does not work - newer Stata format is not supported
ConstRes2010 <- read.dta("Data/ConstResults2010-stata-new.dta")


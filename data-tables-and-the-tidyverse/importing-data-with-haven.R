## Importing data with 'haven'
library(haven)

# Reading in an SPSS "system" file
ConstRes2010 <- read_sav("ConstituencyResults2010.sav")
ConstRes2010

# Reading in an SPSS "portable" file 
ConstRes2010 <- read_por("ConstituencyResults2010.por")
ConstRes2010

# Reading in a Stata file
ConstRes2010 <- read_dta("ConstituencyResults2010.dta")
ConstRes2010

# Reading in a new format Stata file
ConstRes2010 <- read_dta("ConstResults2010-stata-new.dta")
head(ConstRes2010)
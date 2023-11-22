#' # Importing data with the *haven* package 

#' The following makes use of the  *haven* package. You may need to install it from [CRAN](https://cran.r-project.org) using the code `install.packages("haven")` if you want to run this on your computer. (The package is already installed on the notebook container, however.)
#'
#' This notebook makes use of the following files:
#'
#' - [ConstituencyResults2010.sav](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.sav)
#' - [ConstituencyResults2010.por](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.por)
#' - [ConstituencyResults2010.dta](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstituencyResults2010.dta)
#' - [ConstituencyResults2010-stata-new.dta](https://raw.githubusercontent.com/melff/dataman-r/main/03-data-frames/ConstResults2010-stata-new.dta)
#'
#' Currently, these Data files are also available from https://www.pippanorris.com/data.
#' (Previously they were available from http://www.hks.harvard.edu/fs/pnorris/Data/Data.htm.) 

library(haven)

# Reading in an SPSS "system" file
ConstRes2010 <- read_sav("ConstituencyResults2010.sav")
head(ConstRes2010)

# Reading in an SPSS "portable" file 
ConstRes2010 <- read_por("ConstituencyResults2010.por") # This works with 'foreign', but not with 'haven'

# Reading in a Stata file
ConstRes2010 <- read_dta("ConstituencyResults2010.dta")
head(ConstRes2010)

# Reading in a new format Stata file
ConstRes2010 <- read_dta("ConstResults2010-stata-new.dta")
head(ConstRes2010)

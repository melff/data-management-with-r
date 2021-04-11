#' # Reshaping data to long format with *tidyr*

#' The following makes use of the packages *tidyr* and *readr*. You may need to
#' install them from [CRAN](https://cran.r-project.org) using the code
#' `install.packages(c("tidyr","readr"))` if you want to run this on your computer. (The packages are already installed
#' on the notebook container, however.)

options(jupyter.rich_display=FALSE, width=120) # Create output as usual in R

# Inspecting the file
substr(readLines("gini-oecd.tsv",n=5),start=1,stop=50)

library(readr)

gini.oecd <- read_tsv("gini-oecd.tsv",
                      skip=1)

gini.oecd

library(tidyr)

gini.oecd %>% gather(`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,
                      `2013`,`2014`,`2015`,`2016`,`2017`,
                      key="year",value="gini") -> gini.oecd.long
gini.oecd.long

gini.oecd %>% gather(-Location,
                      key="year",value="gini") -> gini.oecd.long
gini.oecd.long

gini.oecd %>% pivot_longer(-Location,
                           names_to="year",
                           values_to="gini") -> gini.oecd.long
gini.oecd.long



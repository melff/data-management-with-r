#' # Reshaping data to wide format with *tidyr*

#' The following makes use of the packages *tidyr* and *readr*. You may need to
#' install them from [CRAN](https://cran.r-project.org) using the code
#' `install.packages(c("tidyr","readr"))` if you want to run this on your computer. (The packages are already installed
#' on the notebook container, however.)

options(jupyter.rich_display=FALSE) # Create output as usual in R

substr(readLines("inequality-oecd-downloaded.csv",n=5),
       start=1,stop=40)

library(readr)

inequality.oecd.dld <- read_csv("inequality-oecd-downloaded.csv")

inequality.oecd.dld

library(tidyr)

inequality.oecd.dld %>% spread(key="SUBJECT",value="Value") ->
                                               inequality.oecd

inequality.oecd[-c(2,4,6)]

library(dplyr)

inequality.oecd.sub <- select(inequality.oecd.dld,
                              LOCATION,SUBJECT,TIME,Value)
inequality.oecd.sub

inequality.oecd.sub %>% spread(key=SUBJECT,
                               value=Value) -> inequality.oecd

inequality.oecd

inequality.oecd.dld %>% pivot_wider(names_from=SUBJECT,
                                    values_from=Value,
                                    id_cols=c(LOCATION,TIME)) ->
                                                inequality.oecd

inequality.oecd



#' # Importing ASCII format data from the American National Election Study

#' The following makes use of the *memisc* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=memisc) using the code
#' `install.packages("memisc")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

library(memisc)

#' This data file is available from the American National Election Study website,
#' along with syntax files in which the structure of the data is declared,
#' as well as the variable lables (descriptions), value labels, and missing values. In order to 
#' obtain these data files (and run the notebook successufully), you need to download them from 
#' the [ANES website for 2008](https://electionstudies.org/data-center/2008-time-series-study/) and upload them to the virtual
#' machine that runs this notebook. 
#' To do this, 
#'
#' 1. open the file manager window of this site using [this link](/user-redirect/tree/05-social-science-surveys/)
#' 2. use the button labelled "Upload" to upload the files that you downloaded from the ANES website.
#' 3. after uploading the file, it should appear in the list of files in the folder. Make sure that they have the names as used in the code that follows.
#'
#' Note that the uploaded data will disappear when the notebook container is reset.
#'
#' The following also makes use of the *memisc* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=memisc) using the code
#' `install.packages("memisc")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

# Note that the following code takes quite a while ...
anes2008TS <- spss.fixed.file(
                  "anes2008TS_dat.txt",
                  columns.file = "anes2008TS_col.sps",
                  varlab.file  = "anes2008TS_lab.sps",
                  codes.file   = "anes2008TS_cod.sps",
                  missval.file = "anes2008TS_md.sps")

description(anes2008TS[1:30])

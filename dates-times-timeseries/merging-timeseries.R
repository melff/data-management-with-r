#' # Merging (multivariate) time series

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *zoo* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=zoo) using the code
#' `install.packages("zoo")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(zoo)

#' The file "zpresidents.RData" was created in an earlier example.

load("unemployment-z.RData")

Netherlands <- unemployment.z[,4]
length(Netherlands)

Belgium <- unemployment.z[,5]
length(Belgium)

Luxembourg <- na.omit(unemployment.z[,6])
length(Luxembourg)

unemployment.benelux <- merge(Netherlands,
                              Belgium,
                              Luxembourg)
head(unemployment.benelux,n=10)

#' # Subsetting "zoo" objects

#' The following makes use of the *zoo* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=zoo) using the code
#' `install.packages("zoo")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(zoo)

as.yearqtr("1945 Q2")

#' The file "zpresidents.RData" was created in an earlier example.

load("zpresidents.RData")

zpresidents[as.yearqtr("1945 Q2")]

qtrs3 <- as.yearqtr(paste(1960:1969,"Q3"))
zpresidents[qtrs3]

qtrs <- paste(rep(1960:1964,each=4),rep(4:1,4),sep="-")
qtrs

zpresidents[as.yearqtr(qtrs)]

load("unemployment-z.RData")

unemployment.z[as.Date("1997-12-31")]

window(zpresidents,
       start = as.yearqtr("1969-1"),
       end   = as.yearqtr("1974-2"))

window(unemployment.z,
       start = as.Date("1980-12-31"),
       end   = as.Date("1989-12-31"))

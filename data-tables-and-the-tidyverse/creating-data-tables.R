#' # Creating data tables

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *data.table* package. You may need to install it from [CRAN](https://cran.r-project.org/package=data.table) using the code `install.packages("data.table")` if you want to run this on your computer. (The package is already installed on the
#'  notebook container, however.)

library(data.table)

UK <- data.table(
           Population = c(55619400,1885400,5424800,3125000),
           Area = c(50301,5460,30090,8023),
           GVA = c(28096,20000,24800,19900),
           country = c("England",
                         "Northern Ireland",
                         "Scotland",
                         "Wales"))
UK

class(UK)

DT <- data.table(
    x = rnorm(1000000),
    y = rnorm(1000000))
DT

load("bes2010feelings.RData")
setDT(bes2010feelings)
class(bes2010feelings)



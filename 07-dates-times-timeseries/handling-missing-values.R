#' # Handling missing values

#' The following makes use of the *zoo* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=zoo) using the code
#' `install.packages("zoo")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(zoo)

#' The file "zpresidents.RData" was created in an earlier example.

load("zpresidents.RData")

# Leads to an error:
presidents.o <- na.omit(presidents)

zpresidents.o <- na.omit(zpresidents)

c("Original length" = length(zpresidents),
  "Length after dropping NAs"  = length(zpresidents.o))

plot(zpresidents,lty=3)
lines(na.contiguous(zpresidents),lwd=2)

plot(zpresidents,lwd=2)
lines(na.approx(zpresidents),lty=2)
lines(na.spline(zpresidents),lty=3)

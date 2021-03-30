# Defining two variables
a <- 1
b <- 2
# Entering the name leads to printing the content of the variable
a
# Showing the variables defined:
ls()
# Removing variables:
rm(a,b)
# Checking the existence of a variable
exists("a")
# Defining and removing "hidden" variables
a <- 1
b <- 2
x <- 3
y <- 4
z <- 42
.zzyx <- 1412
rm(list=ls(all=TRUE))
ls()

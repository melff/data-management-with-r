## Variables 
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


## Saving and Loading
# In this example we create the two variables 'a' and 'b':
a <- 1
b <- 1
# We save them in the data file "ab.RData"
save(a,b,file="ab.RData")
# We then remove the two variables:
rm(a,b)
# With then load the data file
load("ab.RData")
# and verify that the two variables are restored
a
b

## Running a script with and without echo
source("source-echo-demo.R")

source("source-echo-demo.R",echo=TRUE)

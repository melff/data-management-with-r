#' # Saving and loading objects

options(jupyter.rich_display=FALSE) # Create output as usual in R

# In this example we create the two variables 'a' and 'b':
a <- 1
b <- 1
# We save them in the data file "ab.RData"
save(a,b,file="ab.RData")
# We then remove the two variables:
rm(a,b)
ls()

# With then load the data file
load("ab.RData")
# and verify that the two variables are restored
ls()

a

b

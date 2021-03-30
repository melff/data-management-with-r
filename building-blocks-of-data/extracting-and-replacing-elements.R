#' # Extracting and replacing elements of a vector

options(jupyter.rich_display=FALSE) # Create output as usual in R

x <- c(10, 12, 30, 14, 50)

x[1]

x[5]

x[c(2,4,6)]

x[c(1,1,1,2,2)]

x[-c(1,3,5)]

x[c(FALSE,TRUE,FALSE,TRUE,FALSE)]

x[x>=20]

names(x) <- c("a","b","c","d","e")

x[c("a","c")]

set.seed(231)
y <- rnorm(n=12)

y[1:4] <- 0
y

y <- rnorm(n=12)

y[y < 0] <- 0
y

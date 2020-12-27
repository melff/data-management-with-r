## Comparisons
x <- -3:3
x

x == 0

x <- -3:3
y <- c(1:3,0,1:3)
x == y

## Logical operators
a <- c(TRUE,FALSE,TRUE,FALSE)
b <- c(TRUE,TRUE,FALSE,FALSE)

a & b

a | b

!a

a & !b

!(a | b)

x <- -3:3

x > 1 & x < -1

x > 1 | x < -1

a <- c(TRUE,FALSE,NA,TRUE,FALSE,NA,TRUE,FALSE,NA)
b <- c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,NA,NA,NA)

a & b

a | b

#' # Preparing example data for the benchmark study

library(data.table)

library(tibble)

# Here we create 100 variables, each with 100,000 elements
BData <- replicate(100,list(rnorm(100000)))
names(BData) <- paste0("X",sprintf("%d",1:100))
# We add a factor with 3 levels
BData$a <- sample(letters[1:10],size=length(BData[[1]]),
                 replace=TRUE)
BData$b <- sample(letters[1:10],size=length(BData[[1]]),
                 replace=TRUE)

# Put together we have a data frame with 101 variables
# and one million observations
BDataF <- data.frame(BData)
# For later purposes we create a "tibble" ...
BDTbl <- as_tibble(BData)
# and a data table
BDataT <- as.data.table(BData)
save(BDataF,BDTbl,BDataT,
     file="BData.RData")

# Here we create 1500 variables, each with 3,000 elements
SData <- replicate(1500,list(rnorm(3000)))
names(SData) <- paste0("X",sprintf("%d",1:1500))
# We add a factor with 3 levels
SData$a <- sample(letters[1:10],size=length(SData[[1]]),
                  replace=TRUE)
SData$b <- sample(letters[1:10],size=length(SData[[1]]),
                  replace=TRUE)

# Put together we have a data frame with 1,500 variables
# and 3,000 observations
SDataF <- data.frame(SData)
# For later purposes we create a "tibble" ...
SDTbl <- as_tibble(SData)
# and a data table
SDataT <- as.data.table(SData)
save(SDataF,SDTbl,SDataT,
     file="SData.RData")

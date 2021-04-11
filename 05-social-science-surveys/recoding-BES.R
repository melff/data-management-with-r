#' # Recoding data from the British Election Study

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *memisc* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=memisc) using the code
#' `install.packages("memisc")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

library(memisc)

#' The following code picks up with the British Election Study data of the previous script. We use the data file created earlier. For convenience, this data file is available for download from here: []()

load("BES-1983-classvot.RData")

# This code collapses the categories of the vote variable into just four:
BES.1983.classvot <- within(BES.1983.classvot,{
    vote.new <- vote
    vote.new[vote %in% 3:5]        <- 3
    vote.new[vote %in% c(6:10,97)] <- 4
})
# Checking the result:
codebook(BES.1983.classvot$vote.new)

# It is somewhat more convenient to use the 'recode()' function from the
# 'memisc' package:
BES.1983.classvot <- within(BES.1983.classvot,{
    vote.new <- recode(vote,
                       3 <- 3:5,
                       4 <- c(6:10,97),
                       otherwise="copy"
                       )
})
# Checking the result:
codebook(BES.1983.classvot$vote.new)

# Since 'BES.1983.classvot' is not a data frame, but a "data.set" object, we can
# provide value labels while recoding:
BES.1983.classvot <- within(BES.1983.classvot,{
    vote.new <- recode(vote,
                       Conservative  = 1 <- 1,
                       Labour        = 2 <- 2,
                       Alliance      = 3 <- 3:5,
                       Other         = 4 <- c(6:10,97),
                       "Didn't vote" = 5 <- 0,
                       DK            = 8 <- 98,
                       Refused       = 9 <- 95)
    missing.values(vote.new) <- c(5,9)
})
# Checking the result:
codebook(BES.1983.classvot$vote.new)



#' # A simple example for the usage of the *tm* package

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *tm* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=tm) using the code
#' `install.packages("tm")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

# Activating the 'tm' package
library(tm)

# We activate the 'acq' data, a corpus of 50 example news articles
data(acq)
acq

# We take a look at the first element in the corpus, a text document:
class(acq[[1]])

acq[[1]]

inspect(acq[[1]])

# We take a look at the document metadata
meta(acq[[1]])

DublinCore(acq[[1]])

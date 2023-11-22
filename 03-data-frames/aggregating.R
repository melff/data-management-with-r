#' # Aggregating data frames

#' In the following we aggregate data from the British Election Study 2010. The data set [bes2010feelings.RData](https://github.com/melff/dataman-r/raw/main/03-data-frames/bes2010feelings.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings.RData")

#' Here we obtain the average affects towards the major three parties, using an
#' 'old-style' call of the function `aggregate()`.

Mean <- function(x,...)mean(x,...,na.rm=TRUE)
aggregate(bes2010feelings[c("flng.brown","flng.cameron",
                            "flng.clegg","flng.salmond")],
          with(bes2010feelings,
               list(Region=region,Wave=wave)),
          Mean)

#' More recent versions of R also provide a slightly more convenient way of
#' calling `aggregate()` using a formula argument:

aggregate(cbind(flng.brown,
                flng.cameron,
                flng.clegg,
                flng.salmond
                )~region+wave,
          data=bes2010feelings,
          Mean)

#' The *memisc* package has a somewhat more flexible variant of `aggregate()`, the function `Aggregate()`. Here we reproduce the results of `aggregate()`. You may need to install this package using `install.packages("memisc")` from 
#' [CRAN](https://cran.r-project.org/package=memisc) if you want to run this on your computer. (The package is already installed on the notebook container, however.)

suppressMessages(library(memisc))

Aggregate(c(Brown=Mean(flng.brown),
            Cameron=Mean(flng.cameron),
            Clegg=Mean(flng.clegg),
            Salmond=Mean(flng.salmond))~region+wave,
            data=bes2010feelings)

#' However it also allows to used different summary functions.

Aggregate(c(Mean(flng.brown),Var(flng.brown))~region+wave,
          data=bes2010feelings)

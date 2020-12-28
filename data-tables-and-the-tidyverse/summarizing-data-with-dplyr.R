library(dplyr)
load("bes2010feelings.RData")
Mean <- function(x,...) mean(x,na.rm=TRUE,...) 
bes2010feelings %>% group_by(wave,region) %>%
                    summarize(Brown=Mean(flng.brown),
                              Cameron=Mean(flng.cameron),
                              Clegg=Mean(flng.clegg),
                              N=n())

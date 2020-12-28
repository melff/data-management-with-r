load("bes2010feelings.RData")

library(dplyr)
bes2010feelings.sub <- bes2010feelings %>%
                            filter(region == "Scotland") %>%
                            select(wave,
                                   flng.brown,
                                   flng.cameron,
                                   flng.clegg,
                                   flng.salmond)

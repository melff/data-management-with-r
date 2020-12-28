library(data.table)
load("bes2010feelings.RData")
setDT(bes2010feelings)

sctl2010feelings <- bes2010feelings[region=="Scotland"]
bes2010feelings.srtd <- bes2010feelings[order(wave,region)]


bes2010feelings.sub <- bes2010feelings[,.(flng.brown,wave,region)]
names(bes2010feelings.sub)

str(bes2010feelings.sub)

head(bes2010feelings.sub)

sctl2010feelings <- bes2010feelings[region=="Scotland",
                                    .(wave,
                                      flng.brown,
                                      flng.cameron,
                                      flng.clegg,
                                      flng.salmond)]
str(sctl2010feelings)
head(sctl2010feelings)
#' # Creating subsets of data frames

#' Here we use data from the British Election Study 2010. The data set [bes2010feelings-prepost.RData](https://github.com/melff/dataman-r/raw/main/03-data-frames/bes2010feelings-prepost.RData) is prepared from the original available at https://www.britishelectionstudy.com/data-object/2010-bes-cross-section/ by removing identifying information and scrambling the data.

load("bes2010feelings-prepost.RData")

#' We then create a subset with only observations from Scotland
#' and with parties and party leaders that run in Scotland:

bes2010flngs_pre_scotland <- subset(bes2010flngs_pre,
                                    region=="Scotland",
                                    select=c(
                                        flng.brown,
                                        flng.cameron,
                                        flng.clegg,
                                        flng.salmond,
                                        flng.labour,
                                        flng.cons,
                                        flng.libdem,
                                        flng.snp,
                                        flng.green))

#' We can now compare the avarage feeling about Gordon Brown
#' in the whole sample and in the subsample from Scotland:
#' First the whole UK:

with(bes2010flngs_pre,mean(flng.brown,na.rm=TRUE))

#' then the Scotland subsample:

with(bes2010flngs_pre_scotland,mean(flng.brown,na.rm=TRUE))

#' It is also possible to create a subset of cases and variables with the
#' bracket operator, but this is pretty tedious:

bes2010flngs_pre_scotland <- bes2010flngs_pre[
    bes2010flngs_pre$region=="Scotland",c(
                             "flng.labour",
                             "flng.cons",
                             "flng.libdem",
                             "flng.snp",
                             "flng.green",
                             "flng.brown",
                             "flng.cameron",
                             "flng.clegg",
                             "flng.salmond")]

with(bes2010flngs_pre_scotland,mean(flng.brown,na.rm=TRUE))

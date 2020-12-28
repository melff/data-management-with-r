# First we load an R data file that contains data from the 2010
# British election study.
load("bes2010feelings-prepost.RData")

names(bes2010flngs_pre)

# A sensible way to bring these data into long format would be to have the
# feelings towards the parties and their leaders as multiple measurements.
# Therefore we reshape the data in the appropriate long format:

bes2010flngs_pre_long <- reshape(
              within(bes2010flngs_pre,
                     na <- NA),
              varying=list(
                  # Parties
                  c("flng.cons","flng.labour","flng.libdem",
                    "flng.snp","flng.pcym",
                    "flng.green","flng.ukip","flng.bnp"),
                  # Party leaders
                  c("flng.cameron","flng.brown","flng.clegg",
                    "flng.salmond","flng.jones",
                    "na","na","na")
              ),
              v.names=c("flng.parties",
                        "flng.leaders"),
              times=c("Conservative","Labour","LibDem",
                      "SNP","Plaid Cymru",
                      "Green","UKIP","BNP"),
              timevar="party",
              direction="long")
head(bes2010flngs_pre_long,n=14)

library(memisc)
# With the 'Reshape' function the syntax is a bit
# simpler than with 'reshape' from the "stats" package:
bes2010flngs_pre_long <- Reshape(bes2010flngs_pre,
       # Note that "empty" places designate measurement
       # occastions that are to be filled with NAs.
       # In the present case these are measurement 
       # feelings about party leaders that were not
       # asked in the BES 2010 questionnaires.
       flng.leaders=c(flng.cameron,flng.brown,
                      flng.clegg,flng.salmond,
                      flng.jones,,,),
       flng.parties=c(flng.cons,flng.labour,
                      flng.libdem,flng.snp,
                      flng.pcym,flng.green,
                      flng.ukip,flng.bnp),
       party=c("Conservative","Labour","LibDem",
               "SNP","Plaid Cymru",
               "Green","UKIP","BNP"),
       direction="long")

# In long format the observations are sorted such that the variable that
# distinguishes measurement occasions (the party variable) 
# changes faster than the variable that distinguishes individuals:
head(bes2010flngs_pre_long)

# Like with 'reshape', reshaping back from long into wide format takes (almost) the
# same syntax as reshaping from wide into long format:
bes2010flngs_pre_wide <- Reshape(bes2010flngs_pre_long,
       # Note that "empty" places designate measurement
       # occastions that are to be filled with NAs.
       # In the present case these are measurement 
       # feelings about party leaders that were not
       # asked in the BES 2010 questionnaires.
       flng.leaders=c(flng.cameron,flng.brown,
                      flng.clegg,flng.salmond,
                      flng.jones,,,),
       flng.parties=c(flng.cons,flng.labour,
                      flng.libdem,flng.snp,
                      flng.pcym,flng.green,
                      flng.ukip,flng.bnp),
       party=c("Conservative","Labour","LibDem",
               "SNP","Plaid Cymru",
               "Green","UKIP","BNP"),
       direction="wide")

# After reshaping into wide format, the variables that correspond to multiple
# measures of the same variable are grouped together:
head(bes2010flngs_pre_wide)
save(bes2010flngs_pre_long,file="bes2010flngs-pre-long.RData")

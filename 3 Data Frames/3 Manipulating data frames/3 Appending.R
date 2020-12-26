# First we load some example data from the British Election Study 2010
load("bes2010feelings-for-append.RData")

# We now have two BES data frames, one from the pre-election wave and another
# from the post-election wave. They contain the same variables, but in a different
# order:
str(bes2010flngs_pre)
str(bes2010flngs_post)

# If the variables in the two data frames differ trying to use 'rbind' to append
# the data frames fails.
bes2010flngs_prepost <- rbind(bes2010flngs_pre[-1],
                              bes2010flngs_post[-1])

# If the variables in the two data frame are the same but differ in their order,
# 'rbind' succeeds and the variables are sorted all into the same order before the
# data frames are combined into a single one:
bes2010flngs_prepost <- rbind(bes2010flngs_pre,
                              bes2010flngs_post)

# We compare the tail-ends of the data resulting data frame
# 'bes2010flngs_prepost' and the data frame given as second argument to
# 'rbind'. The tail-ends are identical except for the order of the
# variables.
tail(bes2010flngs_prepost)
tail(bes2010flngs_post)

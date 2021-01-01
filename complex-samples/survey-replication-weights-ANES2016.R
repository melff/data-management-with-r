load("anes-2016-prevote-desgn.RData")
library(survey)

# The 'automatic' type gives jackknife replicates
anes_2016_prevote_jk <- as.svrepdesign(anes_2016_prevote_desgn,
                                       type="auto")
# The number of replicates is determined by the number of clusters
anes_2016_prevote_jk
# Here we select the multistage rescaled bootstrap
anes_2016_prevote_boo <- as.svrepdesign(anes_2016_prevote_desgn,
                                        type="mrbbootstrap")
anes_2016_prevote_boo
# By default the number of bootstrap replicates is 50, we can
# change it to 200

anes_2016_prevote_boo <- as.svrepdesign(anes_2016_prevote_desgn,
                                        type="mrbbootstrap",
                                        replicates=200)
anes_2016_prevote_boo

# A function to compute the percentage of 2012 Democratic and Republican voters
# who vote for a candidate of the same party in 2016
StayerPerc <- function(weights,data){
    tab <- xtabs(weights~vote16+recall12,data=data)
    # Remove 'inap' responses
    tab <- tab[-6,-5]
    # Column percentages
    ptab <- 100*prop.table(tab,2)
    # The diagonal are the percentages of 'stayers'
    # among the voters of 2012.
    # The first two elements of the diagonal are
    # the Democratic and Republican stayers.
    structure(diag(ptab)[1:2],
              names=c("Democratic",
                      "Republican"))
}

# Estimates and replication based standard errors based on jackknife 
withReplicates(anes_2016_prevote_jk,
                StayerPerc)

withReplicates(anes_2016_prevote_boo,
                StayerPerc)

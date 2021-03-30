#' # Raking 2016 American National Election Study data

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *survey* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=survey) using the code
#' `install.packages("survey")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(survey)

#' Here we rake the sample design object by recalled vote in 2012 and vote in 2016

load("anes-2016-vprevote-design.RData")
load("popl-results.RData")
anes_2016_prevote_desgn_rake <- rake(
    anes_2016_vprevote_desgn,list(~recall12,~vote16),
    population=list(pop.recall12,pop.vote16),
    control=list(maxit=20))

#' Of course, the marginal distributions of the vote in 2012 and the vote in 2016 are 
#' no longer estimated, so that standard errors now vanish.

100*svymean(~recall12,design=anes_2016_prevote_desgn_rake)

100*svymean(~vote16,design=anes_2016_prevote_desgn_rake)

#' The actual percentage of non-voters in 2016 is obviously much higher than the
#' one estimated from the sample, be it post-stratified or not.

#' We save the raked data for later use.

save(anes_2016_prevote_desgn_rake,file="anes-2016-prevote-desgn-rake.RData")

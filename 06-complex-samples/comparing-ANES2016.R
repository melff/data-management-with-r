#' # Comparing poststratification, raking, and calibration with ANES data

#' The following makes use of the packages *survey* and *memisc*. You may need to
#' install them from [CRAN](https://cran.r-project.org) using the code
#' `install.packages(c("survey","memisc"))` if you want to run this on your computer. (The packages are already installed on the notebook container, however.)

library(survey)

library(memisc)

#' This loads data files created in earlier examples.

load("anes-2016-vprevote-design.RData")
load("anes-2016-prevote-desgn-post.RData")
load("anes-2016-prevote-desgn-rake.RData")
load("anes-2016-prevote-desgn-calib.RData")

#' Let's compare the effect of poststratification and raking on the relation
#' between variables.
#'
#' First, we create a table from the data with valid responses about voting
#' behaviour in 2012 and 2016.

tab <- svytable(~ vote16 + recall12,
                 design = anes_2016_vprevote_desgn)
percentages(vote16 ~ recall12, data=tab)

#' Second, we create a table from the poststatified data.

tab_post <- svytable(~ vote16 + recall12,
                 design = anes_2016_prevote_desgn_post)
percentages(vote16 ~ recall12, data=tab_post)

#' Third, we create a table from the raked data.

tab_rak <- svytable(~ vote16 + recall12,
                    design = anes_2016_prevote_desgn_rake)
percentages(vote16 ~ recall12, data=tab_rak)

#' Fourth, we create a table from the calibrated data

tab_calib <- svytable(~ vote16 + recall12,
                    design = anes_2016_prevote_desgn_calib)
percentages(vote16 ~ recall12, data=tab_calib)

#' Poststratification does not alter percentages that are conditional on the
#' variable used for poststratification. Yet raking does change the conditional percentages.

#' To examine whether raking affects relations between recalled vote in 2012 and
#' vote in 2016 we compute log-odds ratios:

log.odds <- function(x) log((x[1,1]/x[1,2])/(x[2,1]/x[2,2]))

#' Log-odds ratios are a way to describe the relation between two dichotomous
#' variables. Like correlations between continuous variables they are not
#' affected by the marginal distribution.

log.odds(tab)

log.odds(tab_post)

log.odds(tab_rak)

log.odds(tab_calib)

#' Clearly, both poststratfication and raking leaves log-odds ratios
#' unaffected. Calibration has an effect, but this appears to be minor (at least
#' in the present case).

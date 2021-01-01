library(memisc)

anes_2016_sav <- spss.file("anes_timeseries_2016.sav")

# Loading a subset: Only pre-election waves and only
# face-to-face interviews
anes_2016_pre_work_ds <- subset(anes_2016_sav,
                                V160501 == 1,
                                select=c(
                                # According to docs, these are the
                                # sample weights for the
                                # face-to-face component
                                pre_w_f2f     = V160101f,
                                # Face-to-face strata    
                                strat_f2f     = V160201f,
                                psu_f2f       = V160202f,
                                pre_voted12   = V161005,
                                pre_recall12  = V161006,
                                pre_voted     = V161026,
                                pre_vote      = V161027,
                                pre_intov     = V161030,
                                pre_voteint   = V161031#,
                           ))

library(magrittr) # For the '%<>%' operator

anes_2016_pre_work_ds %<>% within({
    # Setting up recalled votes of 2012
    # Since a "default" value for the remaining conditions
    # is used, we use 'check.xor = FALSE' to avoid warnings.
    recall12 <- cases(
        'Did not vote' = 9 <- pre_voted12  == 2,
        'Obama'        = 1 <- pre_recall12 == 1,
        'Romney'       = 2 <- pre_recall12 == 2,
        'Other'        = 3 <- pre_recall12 == 5,
        'Inap'         = 99 <- TRUE, check.xor = FALSE
    )
    # Early voters 
    vote16_1 <- cases(
        'Clinton' = 1 <- pre_voted == 1 & pre_vote == 1,
        'Trump'   = 2 <- pre_voted == 1 & pre_vote == 2,
        'Other'   = 3 <- pre_voted == 1 & pre_vote %in% 3:5,
        'Inap'    = 99 <- TRUE, check.xor = FALSE)
    # Vote intentions
    vote16 <- cases(
        'Clinton' = 1 <- pre_intov == 1 & pre_voteint == 1,
        'Trump'   = 2 <- pre_intov == 1 & pre_voteint == 2,
        'Other'   = 3 <- pre_intov == 1 & pre_voteint %in% 3:6,
        'Will not vote/Not registered' = 8 <- pre_intov %in% c(-1,2),
        'Inap'    = 99 <- TRUE, check.xor = FALSE)
    vote16[] <- ifelse(vote16 == 99 & vote16_1 != 99,
                       vote16_1,
                       vote16)
})

anes_2016_prevote <- as.data.frame(anes_2016_pre_work_ds)
save(anes_2016_prevote,file="anes-2016-prevote.RData")
#Unweighted crosstable
xtabs(~ vote16 + recall12,
      data=anes_2016_prevote)


library(survey)
anes_2016_prevote_desgn <- svydesign(id = ~psu_f2f,
                                     strata = ~strat_f2f,
                                     weights = ~pre_w_f2f,
                                     data = anes_2016_prevote,
                                     nest = TRUE)
anes_2016_prevote_desgn

save(anes_2016_prevote_desgn,file="anes-2016-prevote-desgn.RData")

# We reduce the digits after dot
ops <- options(digits=2)
(tab <- svytable(~ vote16 + recall12,
                 design = anes_2016_prevote_desgn))

# and drop counts of non-valid responses before
# we compute percentages
percentages(vote16 ~ recall12, data=tab[-6,-5])
options(ops)

# Here we compute a F-test of independence with the table, which uses the
# Rao-Scott second-order correction with a Satterthwaite approximation of the
# denominator degrees of freedom is used.
summary(tab)

# The more conventional Pearson-Chi-squared test adjusted with a design-effect
# estimate is obtained by a slight modification
summary(tab, statistic="Chisq")


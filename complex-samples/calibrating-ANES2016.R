library(survey)
load("anes-2016-vprevote-design.RData")
# 'calibrate' expects the names of the calibration vectors to be like those of
# regression coefficents
cal_names(~recall12+vote16,anes_2016_vprevote_desgn)

# This function creates a vector suitable for calibration from the
# data frames that `postStratify()` or `rake()` use
calib_counts <- function(formula,frames){
    dframe2coef <- function(data){
        fname <- names(data)[1]
        flevels <- as.character(data[[1]])
        Freq <- data$Freq
        coefs <- c(sum(Freq),Freq[-1])
        names(coefs) <- c("(Intercept)",
                          paste0(fname,flevels[-1]))
        coefs
    }
    vars <- all.vars(formula)
    for(i in seq_along(vars)){
        var_i <- vars[i]
        frame_i <- frames[[var_i]]
        coef_i <- dframe2coef(frame_i)
        if(i==1)
            res <- coef_i
        else
            res <- c(res,coef_i[-1])
    }
    res
}
load("popl-results.RData")
calib_anes16 <- calib_counts(~recall12+vote16,
                             list(recall12=pop.recall12,
                                  vote16=pop.vote16))

anes_2016_prevote_desgn_calib <- calibrate(
    anes_2016_vprevote_desgn,~recall12+vote16,
    population=calib_anes16)

100*svymean(~recall12,design=anes_2016_prevote_desgn_calib)
100*svymean(~vote16,design=anes_2016_prevote_desgn_calib)
save(anes_2016_prevote_desgn_calib,file="anes-2016-prevote-desgn-calib.RData")
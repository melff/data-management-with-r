#' # Using the replicate weights provided with CHIS data

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *survey* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=survey) using the code
#' `install.packages("survey")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(survey)

library(foreign)

#' The file "`adult.dta`" is downloaded from
#' http://healthpolicy.ucla.edu/chis/data/Pages/GetCHISData.aspx
#' and contains the 2005 wave of the California Health Interview Survey.
#' Redistribution of the data is prohibited, so readers who want to preproduce
#' the following will need to download their own copy of the data set and upload it to the virtual machine that runs this notebook.  To do this, 
#'
#' 1. pull down the "File" menu item and select "Open"
#' 2. An overview of the folder that contains the notebook opens. 
#' 3. The folder view has a button labelled "Upload". Use this to upload the file that you downloaded from the website.
#'
#' Note that the uploaded data will disappear, once you "Quit" the notebook (and the Jupyter instance).

adult_chis <- read.dta("adult.dta",
                       warn.missing.labels=FALSE)

#' The data set contains 80 set of (raked) replicate weights. They are in the
#' variables named "rakedw1" through "rakedw80". Raked sampling weights are
#' in "raked0".
#'
#' We obtain the column numbers of these variables, making use of our knowledge
#' of the name pattern

repw <- which(names(adult_chis) %in% paste0("rakedw",1:80))

#' To apecify replicate weights, we call the function `svrepdesgin`
#' The first argument specifies the variables that will be used for data
#' analysis. The `weights` argument specifies sampling weights, while the
#' function `repweights` specifies the replicate weights. The `data=` argument
#' specifies the data frame where the data all come from.
#' The `combined.weights=` argument is needed here, because the replicate weights
#' were constructed from sampling weights and "pure" replicate weights. Since we
#' do not know the way the replicate weights were constructed we have to specify
#' `type="other"`.

adult_chis_rd <- svrepdesign(adult_chis[-repw],
                             weights=~rakedw0,
                             repweights=adult_chis[repw],
                             data=adult_chis,
                             combined.weights=TRUE,
                             type="other",
                             scale=1,rscales=1)

#' With `svymean()` we get the estimated proportions of the various categories of
#' health insurance status in California 2005, along with standard errors,
#' multiplying by 100, we get percentages.

100*svymean(~instyp_p, design=adult_chis_rd)

#' With `svytotal()` we obtain estimates of how many people have which health
#' insurance status.

svytotal(~instyp_p, design=adult_chis_rd)

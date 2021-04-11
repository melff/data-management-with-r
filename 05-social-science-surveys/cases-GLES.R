#' # Combining variables using case distinctions

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *memisc* package. You may need to install it
#' from [CRAN](https://cran.r-project.org/package=memisc) using the code
#' `install.packages("memisc")` if you want to run this on your computer. (The package is already installed on
#' the notebook container, however.)

library(memisc)

#' The following code works with example data from the 2017 German Longitudinal
#' Election study: It code combines pre- and post-election variables in the to a single
#' party-preference variable for the first (candidate) vote and the second (list) vote.
#'
#' In order to run this notebook successfully, you have to download from [GESIS](https://doi.org/10.4232/1.13236) and upload it to the virtual machine on which this notebook runs. To do this, 
#'
#' 1. pull down the "File" menu item and select "Open"
#' 2. An overview of the folder that contains the notebook opens. 
#' 3. The folder view has a button labelled "Upload". Use this to upload the file that you downloaded from the BES website. Its name should be `ZA6802_en_v3-0-1.sav`.
#'
#' Note that the uploaded data will disappear, once you "Quit" the notebook (and the Jupyter instance).

gles2017.sav <- spss.system.file("ZA6802_en_v3-0-1.sav")
description(gles2017.sav[1:30])

gles2017.vote <- subset(gles2017.sav,
                           select=c(
                               survey = survey1,
                               pre.turnout.int = v10,
                               post.turnout = n10,
                               pre.voteint.first = v11ab,
                               pre.voteint.second = v11bb,
                               post.vote.first = n11ab,
                               post.vote.second = n11bb,
                               pre.postvote.first = v12ab,
                               pre.postvote.second = v12bb
                      ))
codebook(gles2017.vote)

gles2017.vote <- within(gles2017.vote,{
  vote.first <- cases(
              survey == 0 & pre.turnout.int == 6 -> pre.postvote.first,
              survey == 0 & pre.turnout.int %in% 4:5 -> -85,
              survey == 0 & pre.turnout.int %in% 1:3 -> pre.voteint.first,
              survey == 1 & post.turnout ==1 -> post.vote.first,
              survey == 1 & post.turnout ==2 -> -85,
              TRUE -> -97
            )
  vote.second <- cases(
              survey == 0 & pre.turnout.int == 6 -> pre.postvote.second,
              survey == 0 & pre.turnout.int %in% 4:5 -> -85,
              survey == 0 & pre.turnout.int %in% 1:3 -> pre.voteint.second,
              survey == 1 & post.turnout ==1 -> post.vote.second,
              survey == 1 & post.turnout ==2 -> -85,
              TRUE -> -97
  )
  vote.first <- as.item(vote.first, labels = labels(pre.postvote.first))
  vote.second <- as.item(vote.second, labels = labels(pre.postvote.second))
  valid.range(vote.first) <- valid.range(vote.second) <- c(1,900)
})

codebook(gles2017.vote[c("vote.first","vote.second")])

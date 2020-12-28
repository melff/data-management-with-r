library(memisc)
## The following code works with example data from the 2017 German Longitudinal
## Election study: It code combines pre- and post-election variables in the to a single
## party-preference variable for the first (candidate) vote and the second (list) vote

gles2017.sav <- spss.system.file("ZA6802_en_v3-0-1.sav")
description(gles2017.sav)

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

# Inspecting the file
substr(readLines("gini-oecd.tsv",n=5),start=1,stop=50)

library(readr)

gini.oecd <- read_tsv("gini-oecd.tsv",
                      skip=1)
gini.oecd

library(tidyr)

gini.oecd %>% gather(`2007`,`2008`,`2009`,`2010`,`2011`,`2012`,
                      `2013`,`2014`,`2015`,`2016`,`2017`,
                      key="year",value="gini") -> gini.oecd.long

gini.oecd %>% gather(-Location,
                      key="year",value="gini") -> gini.oecd.long

gini.oecd %>% pivot_longer(-Location,
                           names_to="year",
                           values_to="gini") -> gini.oecd.long
gini.oecd.long

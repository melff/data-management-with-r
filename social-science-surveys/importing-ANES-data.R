# This data file is available from the American National Election Study website,
# along with syntax files in which the structure of the data is declared,
# as well as the variable lables (descriptions), value labels, and missing values
library(memisc)
# Note that the following code takes quite a while ...
anes2008TS <- spss.fixed.file(
                  "anes2008TS_dat.txt",
                  columns.file = "anes2008TS_col.sps",
                  varlab.file  = "anes2008TS_lab.sps",
                  codes.file   = "anes2008TS_cod.sps",
                  missval.file = "anes2008TS_md.sps")

description(anes2008TS)

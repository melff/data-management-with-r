#' # The structure of data frames

#' ## Data frame construction

# First create a few vectors from which we construct the data frame:
population  <- c(55619400,1885400,5424800,3125000)
area.sq.m   <- c(50301,5460,30090,8023)
GVA.cap     <- c(28096,20000,24800,19900)
# then we use 'data.frame' to construct the data frame:
UK <- data.frame(population,area.sq.m,GVA.cap)
UK

names(UK)
names(UK) <- c("Population","Area","GVA")
UK

row.names(UK)

row.names(UK) <- c("England",
                   "Northern Ireland",
                   "Scotland",
                   "Wales")
UK

# It is also possible to set the names and row names in the data frame explicitly, when this
# appears more convenient:
UK <- data.frame(
           Population = c(55619400,1885400,5424800,3125000),
           Area = c(50301,5460,30090,8023),
           GVA = c(28096,20000,24800,19900),
           row.names = c("England",
                         "Northern Ireland",
                         "Scotland",
                         "Wales"))
UK

nrow(UK)

ncol(UK)

dim(UK)

#' ## In what follows we treat the data frame 'UK' as a list:

# Here we get the variable 'Population':
UK$Population

# Analoguously, one can use the double bracket-operator ('[[]]')
# to get the variable 'Population':
UK[["Population"]]

# Also the single bracket-operator works as with lists.
# We get a data frame of the first two variables in
# the data frame
UK[1:2]

# Now we get a data frame with the variables named 'Population' and
# 'GVA'
UK[c("Population","GVA")]

#' ## In the next few lines show the selection of rows and columns of a data frame

# We select the first two rows of the
# data frame 'UK' by just using their numbers:
UK[1:2,]

# By referring to row names, we select Scotland and Wales:
UK[c("Scotland","Wales"),]

# As in a previous example, we select the first two columns ...
UK[,1:2]

# and the variables named 'Population' and 'GVA'
UK[,c("Population","GVA")]

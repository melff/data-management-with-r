#' # Reshaping data frames: An example with artificial data

#' Here we construct the data frame that contains the first two rows
#' of the data in wide format in the previous illustration.

example.data.wide <- data.frame(
    id = 1:2,
    v  = c(35,42),
    x1 = c(1.1,2.1),
    x2 = c(1.2,2.2),
    x3 = c(1.3,2.3),
    y1 = c(2.5,3.5),
    y2 = c(2.7,3.7),
    y3 = c(2.9,3.9))
example.data.wide

#' We now call `reshape()` to cast the data into long format

example.data.long <- reshape(data=example.data.wide,
                             varying=list(
                                 # The first group of variables 
                                 # in wide format
                                 c("x1","x2","x3"),
                                 # The second group of variables
                                 # in wide format
                                 c("y1","y2","y3")
                             ),
                             v.names=c("x","y"),
                             timevar="t",
                             times=1:3,
                             direction="long")
example.data.long

#' In order to change the data from long into wide format, we can
#' use almost the same function call, the only difference being
#' the `direction=` argument.

example.data.wide.a <- reshape(data=example.data.long,
                               varying=list(
                                 # The first group of variables 
                                 # in wide format
                                 c("x1","x2","x3"),
                                 # The second group of variables
                                 # in wide format
                                 c("y1","y2","y3")
                               ),
                               v.names=c("x","y"),
                               timevar="t",
                               times=1:3,
                               direction="wide")

#' The second call of `reshape` does not completely revert the first call,
#' because the order of the variables now is different:

example.data.wide.a

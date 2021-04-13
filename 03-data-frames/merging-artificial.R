#' # Merging data frames: An example with artificial data

df1 <- data.frame(
    x = c(1,3,2,4,6,5),
    y = c(1,1,2,2,2,4)
)
df1

df2 <- data.frame(
    a = c(51,42,22),
    b = c(1,2,3)
)
df2

#' In this first attempt at merging, the data frames do not share any variables,
#' hence there is no way of determining which of the rows of the two data frames
#' "belong together". In such a case each row of the first data frame is matched
#' with each of the second data frame. Hence the number of rows of the result
#' equals the products of the numbers of rows of the two data frames.

df12 <- merge(df1,df2)
df12

nrow(df1)

nrow(df2)

nrow(df12)

#' By explicitly specifying the variables used for matching, the result
#' is different: It contains only rows for which matches can be found in
#' both data frames

merge(df1,df2,by.x="y",by.y="b")

#' With the optional argument `all.x=TRUE` the result has a row for each
#' row from the first data frame, whether or not a match is find for it:
#' Missing information (from non-existing rows of the second data frame)
#' is filled up with `NA`.

merge(df1,df2,by.x="y",by.y="b",
      all.x=TRUE)

#' With `all.y=TRUE` the result contains all rows from the second data
#' frame:

merge(df1,df2,by.x="y",by.y="b",
      all.y=TRUE)

#' The argument setting `all=TRUE` is equivalent with
#' `all.x=TRUE` and `all.y=TRUE`

merge(df1,df2,by.x="y",by.y="b",
      all=TRUE)

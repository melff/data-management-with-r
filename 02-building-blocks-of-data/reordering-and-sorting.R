#' # Reordering and sorting elements of a vector

set.seed(231)

x <- rnorm(n=10)
x

x.srt <- sort(x)
x.srt

sort(x,decreasing=TRUE)

stex <- c("1","11","A","a","Ab","AB","ab","aB","B","b","bb")
sort(stex)

set.seed(2134)
x <- rnorm(6)
x

y <- rnorm(6)
y

ii <- order(x)

x.ordered <- x[ii]
y.ordered <- y[ii]

x.ordered

y.ordered

jj <- order(ii)

all(x.ordered[jj] == x)

all(y.ordered[jj] == y)

### Extracting and replacing elements of vectors ################################

x <- c(10, 12, 30, 14, 50)

x[1]

x[5]

x[c(2,4,6)]

x[c(1,1,1,2,2)]

x[-c(1,3,5)]

x[c(FALSE,TRUE,FALSE,TRUE,FALSE)]

x[x>=20]

names(x) <- c("a","b","c","d","e")

x[c("a","c")]

set.seed(231)

y <- rnorm(n=12)

y[1:4] <- 0
y

y <- rnorm(n=12)

y[y < 0] <- 0
y

### Reordering the elements of a vector #######################################

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

### Regular sequences and repetitions #########################################

1:10

seq(from=1,to=10)

seq(from=2,to=10,by=2)

seq(to=49,length.out=5,by=7)

rep(1:5,3)

rep(1:5,each=3)

### Sampling from vector elements #############################################

set.seed(143)

sample(1:9)

sample(1:1000,size=20)

sample(6,size=10,replace=TRUE)


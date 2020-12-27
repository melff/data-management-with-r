### Numeric vectors ##################################################

c(1.2,3.5,5.0,6.7,1.09e-3)

x <- c(1.2,3.5,5.0,6.7,1.09e-3)
length(x)

1:100

x <- c(1,2,3,4,5)
y <- c(3,2,3,2,3)
z <- x + y
print(z)

x <- c(3,2,4,8,7)
y <- x + 1
print(y)

x <- c(3,2,4,8,7)
y <- x + c(1,1,1,1,1)
print(y)

1 + NA

x <- c(-2,-1,0,1,2)
1/x
x/0

### Logical vectors #################################################
## Comparisons
x <- -3:3
x

x == 0

x <- -3:3
y <- c(1:3,0,1:3)
x == y

## Logical operators
a <- c(TRUE,FALSE,TRUE,FALSE)
b <- c(TRUE,TRUE,FALSE,FALSE)

a & b

a | b

!a

a & !b

!(a | b)

x <- -3:3

x > 1 & x < -1

x > 1 | x < -1

a <- c(TRUE,FALSE,NA,TRUE,FALSE,NA,TRUE,FALSE,NA)
b <- c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,NA,NA,NA)

a & b

a | b

### Character vectors ###############################################

Beatles <- c("John", "Paul", "George", "Ringo")
Beatles

paste("one","and","only")
paste(Beatles, collapse=" & ")

First <- c("Mick","Keith","Ronnie","Charlie")
Last <- c("Jagger","Richards","Wood","Watts")
paste(First,Last)

paste(First,Last,sep="_")

substr(Beatles,1,2)

substr(Beatles,1:4,2:5)

Led.Zeppelin.song <- "Whole Lotta Love"
ACDC.song <- sub("Love","Rosie",Led.Zeppelin.song)
print(ACDC.song)

onetofour <- 1:4
names(onetofour) <- c("first","second","third","fourth")
names(onetofour)
onetofour

### Factors #########################################################

set.seed(42)

satisfaction <- sample(1:4,size=20,replace=TRUE)
satisfaction

satisfaction <- ordered(satisfaction,
                       levels=1:4,
                       labels=c(
                           "not at all",
                           "low",
                           "medium",
                           "high"))
satisfaction

table(satisfaction)

levels(satisfaction)

country.orig <- sample(
    c("England","Northern Ireland","Scotland","Wales"),
    size=50,
    prob=c(54786300,5373000,3099100,1851600)/65110000,
    replace=TRUE
)
country <- factor(country.orig)

country <- factor(country.orig,
                  levels=c("England","Wales","Scotland",
                           "Northern Ireland"))
table(country)

str(country)

as.numeric(country)

levels(country) <- c("EN","NI","SC","WL")
table(country)


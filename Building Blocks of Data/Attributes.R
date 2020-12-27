onetofour <- c(first=1,second=2,third=3,fourth=4)

attributes(onetofour)

set.seed(42)

satisfaction <- sample(1:4,size=20,replace=TRUE)
satisfaction <- ordered(satisfaction,
                       levels=1:4,
                       labels=c(
                           "not at all",
                           "low",
                           "medium",
                           "high"))
attributes(satisfaction)

attr(satisfaction,"levels")
levels(satisfaction)

attr(satisfaction,"class")
class(satisfaction)


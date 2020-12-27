### Lists ########################################################

AList <- list(1:5,
              letters[1:6],
              c(TRUE,FALSE,FALSE,TRUE))
AList

AList[1:2]
AList[1]

AList[[2]]

AList[[1:2]]

AList[[1:3]]

length(AList)

FDR <- list(c("John","Delano"),
            c("Roosewelt"))
names(FDR) <- c("first.name","last.name")

FDR <- list(first.name=c("John","Delano"),
            last.name=c("Roosewelt"))
FDR

FDR$last.name

FDR[["last.name"]]

UK <- list(
    country.name = c("England","Northern Ireland","Scotland",
                                                  "Wales"),
    population   = c(54786300,1851600,5373000,3099100),
    area.sq.km   = c(130279,13562,77933,20735),
    GVA.cap      = c(26159,18584,23685,18002))
UK


### Attributes ###################################################

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


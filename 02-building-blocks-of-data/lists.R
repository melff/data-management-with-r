#' # Lists

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
            c("Roosevelt"))

names(FDR) <- c("first.name","last.name")
FDR

FDR <- list(first.name=c("John","Delano"),
            last.name=c("Roosevelt"))
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

data.frame(UK)

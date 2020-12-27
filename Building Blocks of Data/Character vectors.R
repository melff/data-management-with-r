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

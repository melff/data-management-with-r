csv.files <- dir("ManifestoProject",
                 full.names=TRUE,
                 pattern="*.csv")
length(csv.files)

# 'readtext' (a companion package for 'quanteda') is somewhat better able to
# deal with the Manfisto Project CSV files than 'tm':

library(readtext)
UKLib.rt <- readtext("ManifestoProject/*.csv",
               text_field=1,
               docvarsfrom="filenames",
               docvarnames=c("party","date"))
nrow(UKLib.rt)

# Here we cerate an index of documents in the corpus:
UKLib.rta <- aggregate(text~party+date,
                       FUN=function(x)paste(x,collapse=" "),
                       data=UKLib.rt)
nrow(UKLib.rta)

UKLib.rta <- within(UKLib.rta,
              doc_id <- paste(party,date,sep="_"))

UKLib.corpus <- corpus(UKLib.rta)
UKLib.corpus

# Here we combine metadata with the text documents:
manifesto.metadata <- read.csv("documents_MPDataset_MPDS2019b.csv",stringsAsFactors=FALSE)
docvars(UKLib.corpus) <- merge(docvars(UKLib.corpus),
                               manifesto.metadata,
                               by=c("party","date"))
str(docvars(UKLib.corpus))

# Finally we create a document-feature matrix, without punctuation, numbers,
# symbols and stopwords:
UKLib.dfm <- dfm(UKLib.corpus,
                 remove_punct=TRUE,
                 remove_numbers=TRUE,
                 remove_symbols=TRUE,
                 remove=stopwords("english"),
                 stem=TRUE)
str(docvars(UKLib.dfm))

# A more fine-grained control is possible using 'tokens()'

UKLib.toks <- tokens(UKLib.corpus,
                     remove_punct=TRUE,
                     remove_numbers=TRUE)
UKLib.toks

UKLib.dfm <- dfm(UKLib.toks)
UKLib.dfm <- dfm_remove(UKLib.dfm,
                        pattern=stopwords("english"))

UKLib.dfm <- dfm_wordstem(UKLib.dfm,language="english")

# 'quanteda' provides support for dictionaries:

milecondict <- dictionary(list(
                Military=c("military","forces","war","defence","victory","victorious","glory"),
                Economy=c("economy","growth","business","enterprise","market")
))

# Here we extract the frequency of tokens belonging to certain dictionaries:
UKLib.milecon.dfm <- dfm(UKLib.corpus,
                         dictionary=milecondict)
UKLib.milecon.dfm

time <- with(docvars(UKLib.milecon.dfm),
             ISOdate(year=date%/%100,
                     month=date%%100,
                     day=1))

UKLib.ntok <- ntoken(UKLib.corpus)

milit.freq <- as.vector(UKLib.milecon.dfm[,"Military"])
econ.freq <- as.vector(UKLib.milecon.dfm[,"Economy"])
milit.prop <- milit.freq/UKLib.ntok
econ.prop <- econ.freq/UKLib.ntok

# We plot the frequency of tokens over time
op <- par(mfrow=c(2,1),mar=c(3,4,0,0))
plot(time,milit.prop,type="p",ylab="Military")
lines(time,lowess(time,milit.prop)$y)
plot(time,econ.prop,type="p",ylab="Economy")
lines(time,lowess(time,econ.prop)$y)
par(op)

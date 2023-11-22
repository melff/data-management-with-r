#' # An example for the use of *tm* on data from the Manifesto Project

#' The file CSV-files in folder "Manifesto Project"
#' need to be downloaded from the [Manifesto Project website](https://manifesto-project.wzb.eu/datasets).
#' Redistribution of the data is prohibited, so readers who want to reproduce the following will need to download their own copies of the data data files it to the virtual machine that runs this notebook. To do this,
#'
#' 1. open the file manager window of this site using [this link](/user-redirect/tree/09-text-as-data/)
#' 2. create a subfolder named "ManifestoProject" in the current folder "09-text-as-data"
#' 3. activate the subfolder "ManifestoProject" by clicking on it
#' 4. use the button labelled "Upload" to upload the files that you downloaded from the Manifesto Project website
#' 5. after uploading the files, they should appear in the list of files in the folder "ManifestoProject".
#'
#' Note that the uploaded data will disappear, once you "Quit" the notebook (and the Jupyter instance).

# The Manifesto Project data is contained in a collection of CSV files
csv.files <- dir("ManifestoProject",full.names=TRUE,
                 pattern="*.csv")
csv.files

#' The file [documents_MPDataset_MPDS2019b.csv](documents_MPDataset_MPDS2019b.csv) contains the relevant metadata. The original in Excel format 
#' is [available (without registration)](https://manifesto-project.wzb.eu/down/data/2019b/codebooks/documents_MPDataset_MPDS2019b.xlsx) from the Manifesto Project web site.

manifesto.metadata <- read.csv("documents_MPDataset_MPDS2019b.csv",
                               stringsAsFactors=FALSE)

#' The following makes use of the *tm* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=tm) using the code
#' `install.packages("tm")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(tm)

# The following code does not work, due to the peculiar structure of the CSV files
manifesto.corpus <- VCorpus(DirSource("ManifestoProject"))

# To deal with the problem created by the peculiar structure of the files, we
# define a helper function:
getMDoc <- function(file,metadata.file){
    df <- read.csv(file,
                   stringsAsFactors=FALSE)
    content <- paste(df[,1],collapse="\n")
    
    fn <- basename(file)
    fn <- sub(".csv","",fn,fixed=TRUE)
    fn12 <- unlist(strsplit(fn,"_"))

    partycode <- as.numeric(fn12[1])
    datecode <- as.numeric(fn12[2])
    year <- datecode %/% 100
    month <- datecode %% 100
    datetime <- ISOdate(year=year,month=month,day=1)

    mf.meta <- subset(metadata.file,
                      party==partycode & date == datecode)
    if(!length(mf.meta$language))
        mf.meta$language <- "english"
        
    PlainTextDocument(
        content,
        id = fn,
        heading = mf.meta$title,
        datetimestamp = as.POSIXlt(datetime),
        language = mf.meta$language,
        partyname = mf.meta$partyname,
        partycode = partycode,
        datecode = datecode
    )
}

# With the helper function we now create a corpus of UK manifestos:
UKLib.docs <- lapply(csv.files,getMDoc,
                     metadata.file=manifesto.metadata)
UKLib.Corpus <- as.VCorpus(UKLib.docs)
UKLib.Corpus

UKLib.Corpus[[14]]

# We need to deal with the non-ASCII characters, so we define yet another helper
# function:
handleUTF8quotes <- function(x){
    cx <- content(x)
    cx <- gsub("\xe2\x80\x98","'",cx)
    cx <- gsub("\xe2\x80\x99","'",cx)
    cx <- gsub("\xe2\x80\x9a",",",cx)
    cx <- gsub("\xe2\x80\x9b","`",cx)
    cx <- gsub("\xe2\x80\x9c","\"",cx)
    cx <- gsub("\xe2\x80\x9d","\"",cx)
    cx <- gsub("\xe2\x80\x9e","\"",cx)
    cx <- gsub("\xe2\x80\x9f","\"",cx)
    content(x) <- cx
    x
}

# Another helper function is needed to change the texts into lowercase:
toLower <- function(x) {
    content(x) <- tolower(content(x))
    x
}

# We overwrite the 'inspect' method for "TextDocument" objects to a variant that shows only the first
# 20 lines:
inspect.TextDocument <- function(x){
    print(x)
    cat("\n")
    str <- as.character(x)
    str <- substr(x,start=0,stop=500)
    str <- paste(str,"... ...")
    writeLines(str)
    invisible(x)
}

UKLib.Corpus.processed <- tm_map(UKLib.Corpus,handleUTF8quotes)
UKLib.Corpus.processed <- tm_map(UKLib.Corpus.processed,toLower)
inspect(UKLib.Corpus.processed[[14]])

UKLib.Corpus.processed <- tm_map(UKLib.Corpus.processed,removeNumbers)
UKLib.Corpus.processed <- tm_map(UKLib.Corpus.processed,removePunctuation)
inspect(UKLib.Corpus.processed[[14]])

UKLib.Corpus.processed <- tm_map(UKLib.Corpus.processed,stemDocument)
inspect(UKLib.Corpus.processed[[14]])

# After preprocessing the text documents we obtain a document-term matrix:
UKLib.dtm <- DocumentTermMatrix(UKLib.Corpus.processed)
UKLib.dtm

# The various preprocessing steps can be combined into a single step:
UKLib.dtm <- DocumentTermMatrix(
    tm_map(UKLib.Corpus,handleUTF8quotes),
    control=list(
        tolower=TRUE,
        removePunctuation=TRUE,
        removeNumber=TRUE,
        stopwords=TRUE,
        language="en",
        stemming=TRUE
    ))
UKLib.dtm

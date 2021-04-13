#' # A basic example for the usage of the *quanteda* package

#' The following makes use of the *quanteda* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=quanteda) using the code
#' `install.packages("quanteda")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(quanteda)

quanteda_options(print_corpus_max_ndoc=3)

# This is an example corpus contained in the 'quanteda' package
data_corpus_inaugural

mode(data_corpus_inaugural)

class(data_corpus_inaugural)

data_corpus_inaugural[1:3]

str(docvars(data_corpus_inaugural))

docvars(data_corpus_inaugural,"Year")

data_corpus_inaugural$Year

corpus_subset(data_corpus_inaugural, Year > 1945)

subset.corpus <- function(x,...) corpus_subset(x,...)

subset(data_corpus_inaugural, Year > 1945)

docs_containing <- function(x,pattern,...) x[grep(pattern,x,...)]

c_sub <- docs_containing(data_corpus_inaugural,"[Cc]arnage")
c_sub$President

inaugural_sntc <- corpus_reshape(data_corpus_inaugural,
                                 to="sentences")
inaugural_sntc

sntcl <- cbind(docvars(inaugural_sntc),
               len=nchar(inaugural_sntc))
head(sntcl)

sntcl.year <- aggregate(len~Year,data=sntcl,mean)
with(sntcl.year,
     scatter.smooth(Year,len,ylab="Average length of sentences in characters"))

inaugural_ <- corpus_reshape(data_corpus_inaugural,
                             to="documents")
all(inaugural_$Year == data_corpus_inaugural$Year)

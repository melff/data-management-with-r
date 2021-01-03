# Activating the 'tm' package - you may needs to install it first.
library(tm)

# We activate the 'acq' data, a corpus of 50 example news articles
data(acq)
acq

# We take a look at the first element in the corpus, a text document:

class(acq[[1]])
acq[[1]]
inspect(acq[[1]])

# We take a look at the document metadata
meta(acq[[1]])
DublinCore(acq[[1]])

# First, the data are read in
Labour.2017 <- read.csv("UKLabourParty_201706.csv",
                        stringsAsFactors=FALSE)

# Second, some non-ascii characters are substituted 
Labour.2017$content <- gsub("\xE2\x80\x99","'",Labour.2017$content)
str(Labour.2017)

# The variable 'content' contains the text of the manifesto 
Labour.2017 <- Labour.2017$content

Labour.2017[1:5]

# The headings in the manifesto are all-uppercase, this helps
# to identify them:
Labour.2017.hlno <- which(Labour.2017==toupper(Labour.2017))
Labour.2017.headings <- Labour.2017[Labour.2017.hlno]
Labour.2017.headings[1:4]

# All non-heading text is changed to lowercase
labour.2017 <- tolower(Labour.2017[-Labour.2017.hlno])
labour.2017[1:5]

# All lines that contain the pattern 'econom' are collected
ecny.labour.2017 <- grep("econom",labour.2017,value=TRUE)
ecny.labour.2017[1:5]

# Using 'strsplit()' the lines are split into words
labour.2017.words <- strsplit(labour.2017,"[ ,.;:]+")
str(labour.2017.words[1:5])
# The result is a list. We change it into a character vector.
labour.2017.words <- unlist(labour.2017.words)
labour.2017.words[1:20]

# We now count the words and look at the 20 most common ones.
labour.2017.nwords <- table(labour.2017.words)
labour.2017.nwords <- sort(labour.2017.nwords,decreasing=TRUE)
labour.2017.nwords[1:20]

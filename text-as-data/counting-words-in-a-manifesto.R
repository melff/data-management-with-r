#' # Counting words in the UK party manifesto on occasion of the 2017 election

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The file "UKLabourParty_201706.csv" 
#' was downloaded from the [Manifesto Project website](https://manifesto-project.wzb.eu/datasets).
#' Redistribution of the data is prohibited, so readers who want to preproduce the following will need to download their own copy of the data set and upload it to the virtual machine that runs this notebook. To do this,
#'
#' 1. pull down the "File" menu item and select "Open"
#' 2. An overview of the folder that contains the notebook opens.
#' 3. The folder view has a button labelled "Upload". Use this to upload the file that you downloaded from the Manifesto Project website.
#'
#' Note that the uploaded data will disappear, once you "Quit" the notebook (and the Jupyter instance).
#'

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

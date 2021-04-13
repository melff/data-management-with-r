#' # Basic operations on character strings
#'
#' ## `length()` versus `nchar()`

some_great_rock_bands <- c("Led Zeppelin","Pink Floyd","Queen")

length(some_great_rock_bands)

nchar(some_great_rock_bands)

#' ## Character vector subsets versus substrings

some_great_rock_bands <- c("Led Zeppelin","Pink Floyd","Queen")

some_great_rock_bands[1:2]

substr(some_great_rock_bands,start=1,stop=2)

substr(some_great_rock_bands,start=6,stop=15)

#' ## Finding patterns within character strings and character vectors

some_great_rock_bands <- c("Led Zeppelin","Pink Floyd","Queen")

grep("Zeppelin",some_great_rock_bands) # Just the indices

grep("Zeppelin",some_great_rock_bands, value=TRUE) # the elements

grepl("Zeppelin",some_great_rock_bands)

grep("[ei]n$",some_great_rock_bands,value=TRUE)


#' ## Replacing patterns within character strings and character vectors

some_great_rock_bands <- c("Led Zeppelin","Pink Floyd","Queen")

sub("e","i",some_great_rock_bands)

gsub("e","i",some_great_rock_bands)

gsub("([aeiouy]+)","[\\1]",some_great_rock_bands)

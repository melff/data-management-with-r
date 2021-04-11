some_great_rock_bands <- c("Led Zeppelin","Pink Floyd","Queen")

grep("Zeppelin",some_great_rock_bands) # Just the indices
grep("Zeppelin",some_great_rock_bands, value=TRUE) # the elements

grepl("Zeppelin",some_great_rock_bands)

grep("[ei]n$",some_great_rock_bands,value=TRUE)

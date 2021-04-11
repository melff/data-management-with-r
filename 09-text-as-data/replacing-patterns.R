some_great_rock_bands <- c("Led Zeppelin","Pink Floyd","Queen")

sub("e","i",some_great_rock_bands)

gsub("e","i",some_great_rock_bands)

gsub("([aeiouy]+)","[\\1]",some_great_rock_bands)

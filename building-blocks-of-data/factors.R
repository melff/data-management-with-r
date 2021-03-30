#' # Factors

options(jupyter.rich_display=FALSE) # Create output as usual in R
set.seed(42)

satisfaction <- sample(1:4,size=20,replace=TRUE)
satisfaction

satisfaction <- ordered(satisfaction,
                       levels=1:4,
                       labels=c(
                           "not at all",
                           "low",
                           "medium",
                           "high"))
satisfaction

table(satisfaction)

levels(satisfaction)

country.orig <- sample(
    c("England","Northern Ireland","Scotland","Wales"),
    size=50,
    prob=c(54786300,5373000,3099100,1851600)/65110000,
    replace=TRUE
)
country <- factor(country.orig)
country

country <- factor(country.orig,
                  levels=c("England","Wales","Scotland",
                           "Northern Ireland"))
country

table(country)

str(country)

as.numeric(country)

levels(country) <- c("EN","NI","SC","WL")
table(country)



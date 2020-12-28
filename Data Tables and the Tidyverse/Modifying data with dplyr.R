library(dplyr)

UK <- data.frame(
           Population = c(55619400,1885400,5424800,3125000),
           Area = c(50301,5460,30090,8023),
           GVA = c(28096,20000,24800,19900),
           country = c("England",
                         "Northern Ireland",
                         "Scotland",
                         "Wales"))

UK %>% mutate(Density = Population/Area)

# Equivalent code using 'base' R:

within(UK, Density <- Population/Area)


library(zoo)
load("unemployment-z.RData")

Netherlands <- unemployment.z[,4]
length(Netherlands)
Belgium <- unemployment.z[,5]
length(Belgium)
Luxembourg <- na.omit(unemployment.z[,6])
length(Luxembourg)

unemployment.benelux <- merge(Netherlands,
                              Belgium,
                              Luxembourg)
head(unemployment.benelux,n=10)


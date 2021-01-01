unemployment <- read.csv("unemployment.csv")
unemployment.z <- zoo(unemployment[,2:7],
                      order.by=as.Date(
                          ISOdate(year=unemployment[,1],
                                  month=12,
                                  day=31)))
dim(unemployment.z)
class(unemployment.z)

head(unemployment.z)

start(unemployment.z)
end(unemployment.z)

end(unemployment.z) - start(unemployment.z)

# Saved for later use:
save(unemployment.z,file="unemployment-z.RData")

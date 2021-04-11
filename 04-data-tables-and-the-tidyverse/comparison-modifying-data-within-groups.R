library(data.table)
library(dplyr)
library(memisc)
library(rbenchmark)

grouped_modification_benchmark_1 <- benchmark(
    within =
        within(BDataF,{
            X1c <- X1 - ave(X1, a,b,FUN = mean)
            X2c2 <- (X2 - ave(X2, a,b,FUN = mean))^2
            X3ca <- abs(X3 - ave(X3,a,b,FUN = median))
            X4cm <- X4 - ave(X4,a,b,FUN = max)
        }),
    data.table =
        BDataT[,`:=`(X1c = X1 - mean(X1),
                     X2c2 = (X2 - mean(X2))^2,
                     X3ca = abs(X3 - median(X3)),
                     X4cm = X4 - max(X4)),
               by = .(a,b)],
    `group_by + mutate` =
        BDTbl %>% group_by(a,b) %>%
        mutate(X1c = X1 - mean(X1),
               X2c2 = (X2 - mean(X2))^2,
               X3ca = abs(X3 - median(X3)),
               X4cm = X4 - max(X4)),
    withinGroups =
        withinGroups(BDataF, ~a+b, {
            X1c <- X1 - mean(X1)
            X2c2 <- (X2 - mean(X2))^2
            X3ca <- abs(X3 - median(X3))
            X4cm <- X4 - max(X4)
        }),
    columns = c("test","user.self","relative"),
    replications = 100,
    order = NULL,
    relative = "user.self"
)
grouped_modification_benchmark_1

grouped_modification_benchmark_2 <- benchmark(
    within =
        within(SDataF,{
            X1c <- X1 - ave(X1, a,b,FUN = mean)
            X2c2 <- (X2 - ave(X2, a,b,FUN = mean))^2
            X3ca <- abs(X3 - ave(X3,a,b,FUN = median))
            X4cm <- X4 - ave(X4,a,b,FUN = max)
        }),
    data.table =
        SDataT[,`:=`(X1c = X1 - mean(X1),
                     X2c2 = (X2 - mean(X2))^2,
                     X3ca = abs(X3 - median(X3)),
                     X4cm = X4 - max(X4)),
               by = .(a,b)],
    `group_by + mutate` =
        SDTbl %>% group_by(a,b) %>%
        mutate(X1c = X1 - mean(X1),
               X2c2 = (X2 - mean(X2))^2,
               X3ca = abs(X3 - median(X3)),
               X4cm = X4 - max(X4)),
    withinGroups =
        withinGroups(SDataF, ~a+b, {
            X1c <- X1 - mean(X1)
            X2c2 <- (X2 - mean(X2))^2
            X3ca <- abs(X3 - median(X3))
            X4cm <- X4 - max(X4)
        }),
    columns = c("test","user.self","relative"),
    replications = 100,
    order = NULL,
    relative = "user.self"
)
grouped_modification_benchmark_2

save(grouped_modification_benchmark_1,
     grouped_modification_benchmark_2,
     file="grouped-modification-benchmark.RData")


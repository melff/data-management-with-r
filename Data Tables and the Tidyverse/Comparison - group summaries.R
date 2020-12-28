library(data.table)
library(dplyr)
library(memisc)
library(rbenchmark)

grouped_summary_benchmark_1 <- benchmark(
    aggregate =
        aggregate(X1~a+b,data=BDataF, FUN=mean),
    `with + tapply` =
        with(BDataF,tapply(X1,list(a,b),mean)),
    data.table =
        BDataT[,mean(X1),by=.(a,b)],
    `group_by + summarize` =
        BDTbl %>% group_by(a,b) %>% summarize(mean(X1)),
    `select + group_by + summarize` =
        BDTbl %>% select(X1,a,b) %>% group_by(a,b) %>%
                  summarize(mean(X1)),
    withGroups =
        with(Groups(BDataF,~a+b),mean(X1)),
  columns = c("test","user.self","relative"),
  replications = 100,
  order = NULL,
  relative = "user.self"
)
grouped_summary_benchmark_1

grouped_summary_benchmark_2 <- benchmark(
    aggregate =
        aggregate(X1~a+b,data=SDataF, FUN=mean),
    `with + tapply` =
        with(SDataF,tapply(X1,list(a,b),mean)),
    data.table =
        SDataT[,mean(X1),by=.(a,b)],
    `group_by + summarize` =
        SDTbl %>% group_by(a,b) %>% summarize(mean(X1)),
    `select + group_by + summarize` =
        SDTbl %>% select(X1,a,b) %>% group_by(a,b) %>%
                  summarize(mean(X1)),
    withGroups =
        with(Groups(SDataF,~a+b),mean(X1)),
  columns = c("test","user.self","relative"),
  replications = 100,
  order = NULL,
  relative = "user.self"
)
grouped_summary_benchmark_2

save(grouped_summary_benchmark_1,
     grouped_summary_benchmark_2,
     file="grouped-summary-benchmark.RData")

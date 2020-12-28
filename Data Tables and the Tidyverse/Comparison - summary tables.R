library(data.table)
library(dplyr)
library(memisc)
library(rbenchmark)

bench_matrix <- function(x){
    rn <- x$test
    x <- as.matrix(x[,-1])
    rownames(x) <- rn
    x
}

load("grouped-summary-benchmark.RData")

grouped_summary_benchmark_1 <- bench_matrix(grouped_summary_benchmark_1)
grouped_summary_benchmark_2 <- bench_matrix(grouped_summary_benchmark_2)

grouped_summary_benchmark <- memisc::collect(
    "`Big data'"    = grouped_summary_benchmark_1,
    "`Survey data'" = grouped_summary_benchmark_2)
grouped_summary_benchmark <- grouped_summary_benchmark[-5,,]
colnames(grouped_summary_benchmark) <- c("abs.","rel.")
names(dimnames(grouped_summary_benchmark)) <- c("Method","Timing","Data")

ftable(grouped_summary_benchmark,col.vars=3:2)

load("grouped-modification-benchmark.RData")

grouped_modification_benchmark_1 <- bench_matrix(grouped_modification_benchmark_1)
grouped_modification_benchmark_2 <- bench_matrix(grouped_modification_benchmark_2)

grouped_modification_benchmark <- collect(
    "`Big data'"    = grouped_modification_benchmark_1,
    "`Survey data'" = grouped_modification_benchmark_2)
colnames(grouped_modification_benchmark) <- c("abs.","rel.")
names(dimnames(grouped_modification_benchmark)) <- c("Method","Timing","Data")

ftable(grouped_modification_benchmark,col.vars=3:2)
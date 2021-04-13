#' # OECD unemployment data

#' The data file ["unemployment.csv"](unemployment.csv) used below consists of data originally downloaded from the [OECD Database website](https://data.oecd.org).

unemployment <- read.csv("unemployment.csv")

unemployment.ts <- ts(unemployment[2:5],
                      start = 1970)

plot(unemployment.ts)

window(unemployment.ts,
       start=1980,
       end=1989)

delta.unemployment.ts <- diff(unemployment.ts)

plot(delta.unemployment.ts)

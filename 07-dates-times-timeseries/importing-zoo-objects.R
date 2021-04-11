#' # Importing data into "zoo" objects

options(jupyter.rich_display=FALSE) # Create output as usual in R

#' The following makes use of the *zoo* package. You may need to install it from
#' [CRAN](https://cran.r-project.org/package=zoo) using the code
#' `install.packages("zoo")` if you want to run this on your computer. (The
#' package is already installed on the notebook container, however.)

library(zoo)

#' The data file ["unemployment.csv"](https://github.com/melff/dataman-r/raw/main//dates-times-timeseries/OECD-unemployment.R) used below consists of data originally downloaded from the [OECD Database website](https://data.oecd.org).

unemployment_z <- read.csv.zoo("unemployment.csv")
str(unemployment_z)

Text <- "2012/1/6 20
2012/1/7 30
2012/1/8 40
"
read.zoo(text=Text)

read.zoo(text=Text,format="%Y/%m/%d")

Text <- "date,time,x,y
2011-05-08,22:45:21,4,41
2011-05-08,22:45:22,5,42
2011-05-08,22:45:23,5,42
2011-05-08,22:45:24,6,43
"
zobj <- read.csv.zoo(text=Text,
                     index.column=1:2)
zobj

#' # Date objects and date formatting

options(jupyter.rich_display=FALSE) # Create output as usual in R

as.Date(20,origin="1970-01-01")

d <- as.Date("1990-11-09")

format(d,"%e %B % Y")

format(d,"%b %d, %y")

format(d,"%Y-%m-%d")

as.Date("11/09/90", format="%m/%d/%y")

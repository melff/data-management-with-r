#' # Creation of date and time data for given years, months, and days

options(jupyter.rich_display=FALSE) # Create output as usual in R

# Here we create the first days of all months in the year 2000:
# By default the time is noon
ISOdate(2000,1:12,1)

# To get the start of the date we have to set the hour to midnight:
ISOdate(2000,1:12,1,hour=0)

# We can of course also create a sequence of days:
ISOdate(2000,2,1:29,hour=0)

# 'Impossible' dates result in NA:
ISOdate(2000,2,29:31,hour=0)

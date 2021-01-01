# The following line is not really necessary, it is used here only to indicate
# that 'presidents' is a pre-installed data example.
data(presidents)

# The data contains quarterly data about presidents' popularity. 
# The function 'tsp' contains the time series properties: the starting point,
# the end point and the frequency in which the popularity is measured within years.
tsp(presidents)

# With  the functions 'start()', 'end()' and 'frequency()' we can obtain the
# respective time series properties.
start(presidents)
end(presidents)
frequency(presidents)

presidents[1:12]

window(presidents,
       start=1945,
       end=c(1947,4))

nixon <- window(presidents,
                start=1969,
                end=c(1974,2))
nixon
plot(nixon)

time(nixon)

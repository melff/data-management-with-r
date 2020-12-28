library(tidyr)
library(readr)

## Filling missing values with 'fill()' #############################################################

messy_data_str <- "
country,  year,var1, var2
Rodinia,  1297,  67, -3.0
,         1298,  69, -2.9
,         1299,  70, -2.8
Pannotia, 1296,  73, -4.1
,         1297,  74, -3.9
,         1298,  75, -3.9
Pangaea,  1296,  54, -1.2
,         1297,  53, -1.1
,         1298,  52, -1.0
,         1299,  51, -0.9
"

messy_data_str %>% read_csv() -> messy_data
messy_data

messy_data %>% fill(country) -> filled_data
filled_data

## Completing data by missing values with 'complete()' ##############################################

filled_data %>% complete(crossing(country,year))

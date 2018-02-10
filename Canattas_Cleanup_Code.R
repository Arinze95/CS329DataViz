library(tidyverse)
csvURL <- "https://query.data.world/s/Tg6AX5sOLI9PD4kq97XISPi6Pv5zbT"
df <- read_csv(csvURL, col_types = list(
  region = col_character(),
  region.sales = col_number(),
  `region-profit` = col_number() #makes the column numbers not strings, part of data cleanup
)) 
#the 'region profit' ' symbols probably not necesary depends on csv
# Change .+ (1 to infinity periods) and -+ (1 to infinity dashes) in column names to _
names(df) <- gsub("\\.+", "_", names(df))
names(df) <- gsub("-+", "_", names(df))
# Remove non-printable characters from column names.
names(df) <- gsub("[^ -~]", "", names(df)) 
# Change null values in the region_sales and region_profit columns to 0.
df <- df %>% tidyr::replace_na(list(region_sales = 0, region_profit = 0)) #replaces null values with 0
# Remove non-printable characters from all column values.
df <- df %>% dplyr::mutate_all(funs(gsub(pattern="[^ -~]", replacement= "", .))) #mutate all changes all of the data and the function u run on each piece of data is gsub, so this gets rid of all special characters in all of data fields
#the dot on the previous line refers to whatever you are piping in, in this case df
# The following write_csv followed immediately by a read_csv, fixes the column types.
write_csv(df, "/Users/pcannata/Downloads/tmp.csv") # /Users/pcannata/Downloads needs to be changed to a known folder on your machine.
df <- read_csv("/Users/pcannata/Downloads/tmp.csv", col_types = list(
  region = col_character(),
  region_sales = col_number(),
  region_profit = col_number()
))
# Now save the cleaned data to new.csv
write_csv(df, "/Users/pcannata/Downloads/new.csv")
# Now load /tmp/new.csv into a data.world Dataset.
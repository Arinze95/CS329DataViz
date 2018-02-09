library(tidyverse)
csvURL <- "https://query.data.world/s/UFu01kdUJhMxE-MkjesFRKWAGCApjn"
df <- read_csv(csvURL, col_types = list(
  Claim.Number = col_number(),
  Date.Received = parse_date(Date.Received, "%d-%B-%Y"),
  Incident.D = col_date("%d-%B-%Y"),
  Airport.Code = col_character(),
  Airport.Name = col_character(),
  Airline.Name = col_character(),
  Claim.Type = col_character(),
  Claim.Site = col_character(),
  Item.Category = col_character(),
  Close.Amount = col_number(),
  Disposition = col_character()
))
# Change .+ and -+ in column names to _
names(df) <- gsub(".", "_", names(df))
# Remove non-printable characters from column names.
names(df) <- gsub("[^ -~]", "", names(df)) 
# Change dashes in columns to unknowns, and dashes in close_amount to 0's
df$airport_code <- gsub("-", "Unknown", df$airport_code)
df$airport_name <- gsub("-", "Unknown", df$airport_name)
df$airline_name <- gsub("-", "Unknown", df$airline_name)
df$claim_type <- gsub("-", "Unknown", df$claim_type)
df$claim_site <- gsub("-", "Unknown", df$claim_site)
df$item_category <- gsub("-", "Unspecified", df$item_category)
df$close_amount <- gsub("-", "0.00", df$close_amount)
df$disposition <- gsub("-", "Undetermined", df$disposition)

# Remove non-printable characters from all column values.
df <- df %>% dplyr::mutate_all(funs(gsub(pattern="[^ -~]", replacement= "", .)))
# The following write_csv followed immediately by a read_csv, fixes the column types.
write_csv(df, "/Users/derekorji/Documents/claimstmp.csv") # /Users/pcannata/Downloads needs to be changed to a known folder on your machine.
df <- read_csv("/Users/derekorji/Documents/claimstmp.csv", col_types = list(
  Claim_Number = col_number(),
  Date_Received = parse_date("%Y-%B-%d"),
  Incident_D = col_date(),
  Airport_Code = col_character(),
  Airport_Name = col_character(),
  Airline_Name = col_character(),
  Claim_Type = col_character(),
  Claim_Site = col_character(),
  Item_Category = col_character(),
  Close_Amount = col_number(),
  Disposition = col_character()
))
# Now save the cleaned data to new.csv
write_csv(df, "/Users/derekorji/Documents/claimsnew.csv")
# Now load /tmp/new.csv into a data.world Dataset.
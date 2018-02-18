library(tidyverse)
csvURL <- "https://query.data.world/s/5-OstD__RjYPgomgoP0k5_w6DBayoe"
df <- read_csv(csvURL, col_types = list(
  DRG_Definition = col_character(),
  Provider_Id = col_number(),
  Provider_Name = col_character(),
  Provider_Street_Address = col_character(),
  Provider_City = col_character(),
  Provider_State = col_character(),
  Provider_Zip_Code = col_number(),
  Hospital_Referral_Region_Description = col_character(),
  Total_Discharges = col_number(),
  Average_Covered_Charges = col_number(), #changed to numbers
  Average_Total_Payments = col_number(), #changed to numbers
  Average_Medicare_Payments = col_number() #changed to numbers
))
  



# Remove non-printable characters from column names.
names(df) <- gsub("[^ -~]", "", names(df)) 
names(df) <- gsub(" ", "_", names(df)) 
#Get rid of dollar symbols in cells
df$Average_Covered_Charges <- gsub("\\$", "", df$Average_Covered_Charges)
df$Average_Total_Payments <- gsub("\\$", "", df$Average_Total_Payments)
df$Average_Medicare_Payments <- gsub("\\$", "", df$Average_Medicare_Payments)

#get rid of the leading numbers in DRG_definition
df$DRG_Definition <- gsub("[0123456789-]", "", df$DRG_Definition)
df$DRG_Definition <- gsub("  ", "", df$DRG_Definition)




# Remove non-printable characters from all column values.
df <- df %>% dplyr::mutate_all(funs(gsub(pattern="[^ -~]", replacement= "", .)))

# The following write_csv followed immediately by a read_csv, fixes the column types.
write_csv(df, "C:/Users/bwkerbow/Desktop/Hospital_Visit_Data_TX.csv") 

df <- read_csv("C:/Users/bwkerbow/Desktop/Hospital_Visit_Data_TX.csv", col_types = list(
  DRG_Definition = col_character(),
  Provider_Id = col_number(),
  Provider_Name = col_character(),
  Provider_Street_Address = col_character(),
  Provider_City = col_character(),
  Provider_State = col_character(),
  Provider_Zip_Code = col_number(),
  Hospital_Referral_Region_Description = col_character(),
  Total_Discharges = col_number(),
  Average_Covered_Charges = col_number(), #changed to numbers
  Average_Total_Payments = col_number(), #changed to numbers
  Average_Medicare_Payments = col_number() #changed to numbers
))
# Now save the cleaned data to new.csv
write_csv(df, "C:/Users/bwkerbow/Desktop/Hospital_Visit_Data_TX.csv")


# Now load /tmp/new.csv into a data.world Dataset.
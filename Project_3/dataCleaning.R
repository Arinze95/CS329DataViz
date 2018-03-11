library(tidyverse)
csvURL <- "https://query.data.world/s/8NFAXz99XN1E_ZYGRuRCCL7d751DpX"
df <- read_csv(csvURL, col_types = list(
  country = col_character(),
 
  adult_literacy_rate = col_number(), #changed to numbers
  gross_national_income_per_capita_ppp_international = col_number(), 
  population_in_thousands_total = col_number(), 
  population_median_age_years = col_number(),
  per_capita_total_expenditure_on_health_ppp_int = col_number(),
  per_capita_government_expenditure_on_health_ppp_int = col_number(),
  healthy_life_expectancy_hale_at_birth_years_both_sexes = col_number(),
  life_expectancy_at_birth_years_both_sexes =col_number(),
  population_with_sustainable_access_to_improved_sanitation_total = col_number(),
  aid_received_total = col_number(),
  income_per_person= col_number(),
  population_proportion_over_60= col_number(),
  population_proportion_under_15= col_number(),
  contraceptive_prevalence= col_number(),
  total_expenditure_on_health_as_percentage_of_gross_domestic_product= col_number(),
  children_per_woman= col_number(),
  infant_mortality_rate= col_number(),
  patents_granted= col_number()
  
))
  



# Remove non-printable characters from column names.
names(df) <- gsub("[^ -~]", "", names(df)) 
names(df) <- gsub(" ", "_", names(df)) 
#Get rid of null values
df[is.na(df)] <-0


# Remove non-printable characters from all column values.
df <- df %>% dplyr::mutate_all(funs(gsub(pattern="[^ -~]", replacement= "", .)))

# The following write_csv followed immediately by a read_csv, fixes the column types.
write_csv(df, "/Users/Jeffrey/Documents/school/Spring 2018/cs329/proj1/CS329DataViz/Project_3/WHO_clean.csv") 

df <- read_csv("/Users/Jeffrey/Documents/school/Spring 2018/cs329/proj1/CS329DataViz/Project_3/WHO_clean.csv", col_types = list(
  country = col_character(),
  
  adult_literacy_rate = col_number(), #changed to numbers
  gross_national_income_per_capita_ppp_international = col_number(), 
  population_in_thousands_total = col_number(), 
  population_median_age_years = col_number(),
  per_capita_total_expenditure_on_health_ppp_int = col_number(),
  per_capita_government_expenditure_on_health_ppp_int = col_number(),
  healthy_life_expectancy_hale_at_birth_years_both_sexes = col_number(),
  life_expectancy_at_birth_years_both_sexes =col_number(),
  population_with_sustainable_access_to_improved_sanitation_total = col_number(),
  aid_received_total = col_number(),
  income_per_person= col_number(),
  population_proportion_over_60= col_number(),
  population_proportion_under_15= col_number(),
  contraceptive_prevalence= col_number(),
  total_expenditure_on_health_as_percentage_of_gross_domestic_product= col_number(),
  children_per_woman= col_number(),
  infant_mortality_rate= col_number(),
  patents_granted= col_number()
))
# Now save the cleaned data to new.csv
write_csv(df, "/Users/Jeffrey/Documents/school/Spring 2018/cs329/proj1/CS329DataViz/Project_3/WHO_clean.csv")


# Now load /tmp/new.csv into a data.world Dataset.
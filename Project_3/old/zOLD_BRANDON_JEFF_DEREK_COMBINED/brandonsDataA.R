dfA <- eventReactive(c(input$selectSystemOfGovernment_1), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select system_of_government, total_expenditure_on_health_as_percentage_of_gross_domestic_product, life_expectancy_at_birth_years_both_sexes, country
    from WHO_Cleanest W
    where system_of_government in (?, ?, ?, ?) and total_expenditure_on_health_as_percentage_of_gross_domestic_product>0 and life_expectancy_at_birth_years_both_sexes > 0
    order by system_of_government
    ")
  paramQuery$params <- c(input$selectSystemOfGovernment_1[1], input$selectSystemOfGovernment_1[2], input$selectSystemOfGovernment_1[3], input$selectSystemOfGovernment_1[4])
  data.world::query(paramQuery, dataset = project)
})

dfA0 <- eventReactive(c(input$selectSystemOfGovernment_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(population_in_thousands_total, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})

dfA <- eventReactive(c(input$selectCountry_1,input$HaleFilter), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select country,healthy_life_expectancy_hale_at_birth_years_both_sexes,total_expenditure_on_health_as_percentage_of_gross_domestic_product
    from WHO_Cleaner 
    where country in (?, ?, ?, ?,?,?,?,?,?,?) and healthy_life_expectancy_hale_at_birth_years_both_sexes between ? and ? 
    order by healthy_life_expectancy_hale_at_birth_years_both_sexes
    
    ")
  paramQuery$params <- c(input$selectCountry_1[1], input$selectCountry_1[2], input$selectCountry_1[3], input$selectCountry_1[4], input$selectCountry_1[5], input$selectCountry_1[6], input$selectCountry_1[7], input$selectCountry_1[8], input$selectCountry_1[9], input$selectCountry_1[10],input$HaleFilter[1],input$HaleFilter[2])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$HaleFilter,input$selectCountry_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(healthy_life_expectancy_hale_at_birth_years_both_sexes, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})

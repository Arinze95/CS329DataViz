dfA <- eventReactive(c(input$selectCity_1,input$PaymentFilter), { 
  project2 <- "https://data.world/jeffrey-feng/s18-edv-project-2" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select provider_city, average_total_payments
    from hospital_visit_data_tx 
    where provider_city in (?, ?, ?, ?,?,?,?,?,?,?) and average_total_payments between ? and ?
    order by average_total_payments
    
    ")
  paramQuery$params <- c(input$selectCity_1[1], input$selectCity_1[2], input$selectCity_1[3], input$selectCity_1[4], input$selectCity_1[5], input$selectCity_1[6], input$selectCity_1[7], input$selectCity_1[8], input$selectCity_1[9], input$selectCity_1[10],input$PaymentFilter[1],input$PaymentFilter[2])
  data.world::query(paramQuery, dataset = project2)
})

dfA1 <- eventReactive(c(input$PaymentFilter,input$selectCity_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(shipping_cost, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})

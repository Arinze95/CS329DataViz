dfA <- eventReactive(c(input$selectCity_1), { 
  project <- "https://data.world/brandon-kerbow/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    " 
    SELECT city, nightly_price
    FROM airbnbclean
    where city in (?,?,?,?,?,?)
   
    
    ")
  paramQuery$params <- c(input$selectCity_1[1], input$selectCity_1[2], input$selectCity_1[3], input$selectCity_1[4], input$selectCity_1[5], input$selectCity_1[6])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectCity_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(nightly_price, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})

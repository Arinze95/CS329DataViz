dfA <- eventReactive(c(input$selectRegion_1, input$PopFilter_1), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select population_proportion_under_15, region
    from who_cleaner
    where population_proportion_under_15 between ? and ? and region in (?, ?, ?, ?, ?, ?, ?, ?)
    order by region
    ")
  paramQuery$params <- c(input$PopFilter_1[1], input$PopFilter_1[2], input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4], input$selectRegion_1[5], input$selectRegion_1[6], input$selectRegion_1[7], input$selectRegion_1[8])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectRegion_1, input$PopFilter_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(population_proportion_under_15, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})

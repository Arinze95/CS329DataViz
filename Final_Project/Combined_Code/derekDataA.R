dfAderek <- eventReactive(c(input$selectRegion_1derek, input$PopFilter_1), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select population_proportion_under_15, region
    from who_cleaner
    where population_proportion_under_15 between ? and ? and region in (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    order by region
    ")
  paramQuery$params <- c(input$PopFilter_1[1], input$PopFilter_1[2], input$selectRegion_1derek[1], input$selectRegion_1derek[2], input$selectRegion_1derek[3], input$selectRegion_1derek[4], input$selectRegion_1derek[5], input$selectRegion_1derek[6], input$selectRegion_1derek[7], input$selectRegion_1derek[8], input$selectRegion_1derek[9], input$selectRegion_1derek[10], input$selectRegion_1derek[11])
  data.world::query(paramQuery, dataset = project)
})

dfA1derek <- eventReactive(c(input$selectRegion_1derek, input$PopFilter_1, input$yDataMin__6_, input$yDataMax__6_), { 
  if( ! is.na(input$yDataMin__6_) & ! is.na(input$yDataMax__6_)) {
    dfAderek() %>% dplyr::filter(between(population_proportion_under_15, input$yDataMin__6_, input$yDataMax__6_))
  }
  else {
    dfAderek()
  }
})

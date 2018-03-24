dfADerek <- eventReactive(c(input$selectRegionDerek_1, input$PopFilter_1), { 
  projectDerek <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select population_proportion_under_15, region
    from who_cleaner
    where population_proportion_under_15 between ? and ? and region in (?, ?, ?, ?, ?, ?, ?, ?)
    order by region
    ")
  paramQuery$params <- c(input$PopFilter_1[1], input$PopFilter_1[2], input$selectRegionDerek_1[1], input$selectRegionDerek_1[2], input$selectRegionDerek_1[3], input$selectRegionDerek_1[4], input$selectRegionDerek_1[5], input$selectRegionDerek_1[6], input$selectRegionDerek_1[7], input$selectRegionDerek_1[8])
  data.world::query(paramQuery, dataset = projectDerek)
})

dfA1Derek <- eventReactive(c(input$selectRegionDerek_1, input$PopFilter_1, input$yDataMin__5_, input$yDataMax__5_), { 
  if( ! is.na(input$yDataMin__5_) & ! is.na(input$yDataMax__5_)) {
    dfADerek() %>% dplyr::filter(between(population_proportion_under_15, input$yDataMin__5_, input$yDataMax__5_))
  }
  else {
    dfADerek()
  }
})

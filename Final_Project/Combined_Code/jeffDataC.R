jeffdfC <- eventReactive(c(input$selectRegion_1,input$AgeFilter), { 
  project <- "https://data.world/kyl617/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select contraceptive_prevalence,population_median_age_years
  from who_cleanest2
where region in (?,?,?,?,?,?,?,?,?) and contraceptive_prevalence > .1

    
    ")
  paramQuery$params <- c(input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4], input$selectRegion_1[5], input$selectRegion_1[6], input$selectRegion_1[7], input$selectRegion_1[8], input$selectRegion_1[9])
  data.world::query(paramQuery, dataset = project)
})

jeffdfC1 <- eventReactive(c(input$AgeFilter,input$selectRegion_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    jeffdfC() %>% dplyr::filter(between(Average, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    jeffdfC()
  }
})

dfB <- eventReactive(c(input$selectRegion_1,input$AgeFilter), { 
  project <- "https://data.world/kyl617/s18-edv-final-project" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select region, system_of_government, avg(population_median_age_years) Average
from who_cleanest2
where region in (?,?,?,?,?,?,?,?,?)
and system_of_government != 'n/a'
group by region,who_cleanest2.system_of_government
having avg(population_median_age_years) between ? and ?
order by region, system_of_government
    
    ")
  paramQuery$params <- c(input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4], input$selectRegion_1[5], input$selectRegion_1[6], input$selectRegion_1[7], input$selectRegion_1[8], input$selectRegion_1[9],input$AgeFilter[1],input$AgeFilter[2])
  data.world::query(paramQuery, dataset = project)
})

dfB1 <- eventReactive(c(input$AgeFilter,input$selectRegion_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfB() %>% dplyr::filter(between(Average, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfB()
  }
})

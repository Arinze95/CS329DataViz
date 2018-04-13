dfBJeff <- eventReactive(c(input$selectRegion_1,input$AgeFilter), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select region, system_of_government, avg(population_median_age_years) Average
from who_cleanest
where region in (?,?,?,?,?,?,?,?,?,?,?)
and system_of_government != 'n/a'
group by region,who_cleanest.system_of_government
having avg(population_median_age_years) between ? and ?
order by region, system_of_government
    
    ")
  paramQuery$params <- c(input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4], input$selectRegion_1[5], input$selectRegion_1[6], input$selectRegion_1[7], input$selectRegion_1[8], input$selectRegion_1[9], input$selectRegion_1[10], input$selectRegion_1[11],input$AgeFilter[1],input$AgeFilter[2])
  data.world::query(paramQuery, dataset = project)
})

dfB1Jeff <- eventReactive(c(input$AgeFilter,input$selectRegion_1, input$yDataMin__4_, input$yDataMax__4_), { 
  if( ! is.na(input$yDataMin__4_) & ! is.na(input$yDataMax__4_)) {
    dfBJeff() %>% dplyr::filter(between(Average, input$yDataMin__4_, input$yDataMax__4_))
  }
  else {
    dfBJeff()
  }
})

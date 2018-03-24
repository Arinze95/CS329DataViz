dfCderek <- eventReactive(c(input$selectRegi_1, input$poFilter_1), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select region, avg(population_proportion_under_15) as pop15, avg(population_proportion_over_60) as pop60 
from who_cleaner
    where region in (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    group by region 
    order by region
    ")
  paramQuery$params <- c(input$poFilter_1[1], input$poFilter_1[2],input$selectRegi_1[1], input$selectRegi_1[2], input$selectRegi_1[3], input$selectRegi_1[4],input$selectRegi_1[5], input$selectRegi_1[6], input$selectRegi_1[7], input$selectRegi_1[8], input$selectRegi_1[9], input$selectRegi_1[10], input$selectRegi_1[11])
  data.world::query(paramQuery, dataset = project)
})

dfC1derek <- eventReactive(c(input$selectRegi_1, input$poFilter_1, input$yDataMin__8_, input$yDataMax__8_), { 
  if( ! is.na(input$yDataMin__8_) & ! is.na(input$yDataMax__8_)) {
    dfCderek() %>% dplyr::filter(between(pop15, input$yDataMin__8_, input$yDataMax__8_))
  }
  else {
    dfCderek()
  }
})


  
 
dfAJeff <- eventReactive(c(input$selectRegion_1,input$ContraFilter), { 
  projectJeff <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select region, system_of_government, avg(contraceptive_prevalence) Average
from who_cleanest
where region in (?,?,?,?,?,?,?,?,?)
and system_of_government != 'n/a'
group by region,who_cleanest.system_of_government
having avg(contraceptive_prevalence) between ? and ?
order by region, system_of_government
    
    ")
  paramQuery$params <- c(input$selectRegion_1[1], input$selectRegion_1[2], input$selectRegion_1[3], input$selectRegion_1[4], input$selectRegion_1[5], input$selectRegion_1[6], input$selectRegion_1[7], input$selectRegion_1[8], input$selectRegion_1[9],input$ContraFilter[1],input$ContraFilter[2])
  data.world::query(paramQuery, dataset = projectJeff)
})

dfA1Jeff <- eventReactive(c(input$ContraFilter,input$selectRegion_1, input$yDataMin__3_, input$yDataMax__3_), { 
  if( ! is.na(input$yDataMin__3_) & ! is.na(input$yDataMax__3_)) {
    dfAJeff() %>% dplyr::filter(between(Average, input$yDataMin__3_, input$yDataMax__3_))
  }
  else {
    dfAJeff()
  }
})



dfAOrji <- eventReactive(c(input$selectRegion_1Orji, input$PatentFilter_1), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    with q1 as (
select region, avg(patents_granted) as avgpatent
    from who_cleaner
    group by region
  )
    
    select * from 
    q1
    where avgpatent between ? and ? and region in (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    order by region
    ")
  paramQuery$params <- c(input$PatentFilter_1[1], input$PatentFilter_1[2], input$selectRegion_1Orji[1], input$selectRegion_1Orji[2], input$selectRegion_1Orji[3], input$selectRegion_1Orji[4], input$selectRegion_1Orji[5], input$selectRegion_1Orji[6], input$selectRegion_1Orji[7], input$selectRegion_1Orji[8], input$selectRegion_1Orji[9], input$selectRegion_1Orji[10], input$selectRegion_1Orji[11])
  data.world::query(paramQuery, dataset = project)
})

dfA1Orji <- eventReactive(c(input$selectRegion_1Orji, input$PatentFilter_1, input$yDataMin__10_, input$yDataMax__10_), { 
  if( ! is.na(input$yDataMin__10_) & ! is.na(input$yDataMax__10_)) {
    dfAOrji() %>% dplyr::filter(between(avgpatent, input$yDataMin__10_, input$yDataMax__10_))
  }
  else {
    dfAOrji()
  }
})

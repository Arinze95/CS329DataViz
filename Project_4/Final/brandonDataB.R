dfBBrandon <- eventReactive(c(input$selectCity_1,input$PriceFilter), { 
  project <- "https://data.world/brandon-kerbow/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select city, allows_pets, avg(nightly_price) Average
from AirBnBClean
where city in (?,?,?,?,?,?)

group by city,AirBnBClean.allows_pets
having avg(nightly_price) between ? and ?
order by city, allows_pets
    
    ")
  paramQuery$params <- c(input$selectCity_1[1], input$selectCity_1[2], input$selectCity_1[3], input$selectCity_1[4], input$selectCity_1[5], input$selectCity_1[6],input$PriceFilter[1],input$PriceFilter[2])
  data.world::query(paramQuery, dataset = project)
})

dfB1Brandon <- eventReactive(c(input$PriceFilter,input$selectCity_1, input$yDataMin__4_, input$yDataMax__4_), { 
  if( ! is.na(input$yDataMin__4_) & ! is.na(input$yDataMax__4_)) {
    dfBBrandon() %>% dplyr::filter(between(Average, input$yDataMin__4_, input$yDataMax__4_))
  }
  else {
    dfBBrandon()
  }
})

dfABrandon <- eventReactive(c(input$selectCity_1,input$PriceFilter), { 
  projectBrandon <- "https://data.world/brandon-kerbow/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select city, property_type, avg(nightly_price) Average
from AirBnBClean
where city in (?,?,?,?,?,?) and property_type in ('Apartment','Condominium','House','Loft','Townhouse')
group by city, AirBnBClean.property_type
having avg(nightly_price) between ? and ?
order by city, property_type
    
    ")
  paramQuery$params <- c(input$selectCity_1[1], input$selectCity_1[2], input$selectCity_1[3], input$selectCity_1[4], input$selectCity_1[5], input$selectCity_1[6],input$PriceFilter[1],input$PriceFilter[2])
  data.world::query(paramQuery, dataset = projectBrandon)
})

dfA1Brandon <- eventReactive(c(input$PriceFilter,input$selectCity_1, input$yDataMin__3_, input$yDataMax__3_), { 
  if( ! is.na(input$yDataMin__3_) & ! is.na(input$yDataMax__3_)) {
    dfABrandon() %>% dplyr::filter(between(Average, input$yDataMin__3_, input$yDataMax__3_))
  }
  else {
    dfABrandon()
  }
})



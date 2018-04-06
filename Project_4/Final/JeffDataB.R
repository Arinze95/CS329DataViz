dfBa <- eventReactive(c(input$selectCity_1), { 
  project <- "https://data.world/brandon-kerbow/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    SELECT  zipcode, avg_total_income
    FROM irsincomebyzipcode 
    
    ")
  paramQuery$params <- c(input$selectCity_1[1], input$selectCity_1[2], input$selectCity_1[3], input$selectCity_1[4], input$selectCity_1[5], input$selectCity_1[6])
  data.world::query(paramQuery, dataset = project)
})

dfBb <- eventReactive(c(input$selectCity_1), { 
  project <- "https://data.world/brandon-kerbow/s18-edv-project-4" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    SELECT  *
    FROM airbnbclean
    where city in (?,?,?,?,?,?)
    
    ")
  paramQuery$params <- c(input$selectCity_1[1], input$selectCity_1[2], input$selectCity_1[3], input$selectCity_1[4], input$selectCity_1[5], input$selectCity_1[6])
  data.world::query(paramQuery, dataset = project)
})
dfB <- eventReactive(c(input$selectCity_1), { 
  dfBc<-dfBa()%>%dplyr::mutate(new=gsub(pattern = ",", replacement = "", zipcode))
  dfBd<-dfBb()%>%dplyr::mutate(new=gsub(pattern = ",", replacement = "", zipcode))
  dfBe<-dfBc%>%dplyr::mutate(newZip=as.numeric(new))%>%dplyr::right_join(dfBd,by=c("new"="new"))
  
  
})

dfB1 <- eventReactive(c(input$selectCity_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfB() %>% dplyr::filter(between(nightly_price, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfB()
  }
})

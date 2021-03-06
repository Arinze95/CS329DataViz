dfBderek <- eventReactive(c(input$selectReg_1, input$incomeFilter_1), { 
  project <- "https://data.world/jeffrey-feng/s18-edv-project-3" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select gross_national_income_per_capita_ppp_international, region
    from who_cleaner 
    where gross_national_income_per_capita_ppp_international between ? and ? and
region in (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    order by region
    ")
  paramQuery$params <- c(input$incomeFilter_1[1], input$incomeFilter_1[2], input$selectReg_1[1], input$selectReg_1[2], input$selectReg_1[3], input$selectReg_1[4],input$selectReg_1[5], input$selectReg_1[6], input$selectReg_1[7], input$selectReg_1[8], input$selectReg_1[9], input$selectReg_1[10], input$selectReg_1[11])
  data.world::query(paramQuery, dataset = project)
})

dfB1derek <- eventReactive(c(input$selectReg_1, input$incomeFilter_1, input$yDataMin__7_, input$yDataMax__7_), { 
  if( ! is.na(input$yDataMin__7_) & ! is.na(input$yDataMax__7_)) {
    dfBderek() %>% dplyr::filter(between(gross_national_income_per_capita_ppp_international, input$yDataMin__7_, input$yDataMax__7_))
  }
  else {
    dfBderek()
  }
})

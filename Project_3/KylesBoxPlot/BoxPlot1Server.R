# Change all __1_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__1_ <- downloadHandler(
  filename = function(){"WHO_Cleanest.csv"}, 
  content = function(fname){
    write.csv(df1(), fname)
  }
)
output$table__1_ <- renderDataTable({
  DT::datatable(df1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$BoxPlotPlot__1_ <- renderPlotly({
  plot = df1() %>% ggplot() + 
    geom_boxplot(mapping = aes(x = region, y = gross_national_income_per_capita_ppp_international, colour = system_of_government)) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__1_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__1_), 
      legend.text=element_text(size=input$legendItemSize__1_),
      legend.key = element_rect(size = input$legendKeySize__1_),
      legend.key.size = unit(input$legendKeySize__1_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__1_),
          axis.title=element_text(size=input$textFont__1_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__1_)) + #ggtitle(paste(Hospital_Regions(), input$title__1_)) +
    xlab(input$xLabel__1_) + ylab(input$yLabel__1_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__1_)
  
  if( ! is.na(input$plotWidth__1_) & ! is.na(input$plotHeight__1_))
    ggplotly(plot, tooltip = c("region", "gross_national_income_per_capita_ppp_international"), session="knitr", width = input$plotWidth__1_, height = input$plotHeight__1_)
  else
    ggplotly(plot, tooltip = c("region", "gross_national_income_per_capita_ppp_international"), session="knitr") 
})
# ---------------------------------------------------------

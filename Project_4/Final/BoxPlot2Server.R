# Change all __7_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__7_ <- downloadHandler(
  filename = function(){"Boxplot2.csv"}, 
  content = function(fname){
    write.csv(dfB1(), fname)
  }
)
output$table__7_ <- renderDataTable({
  DT::datatable(dfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Histogram__7_ <- renderPlotly({
  plot = dfB1() %>% ggplot(aes(x=city,y=avg_total_income)) + 
    geom_boxplot() +
    
    theme(plot.title = element_text(size = input$titleFont__7_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__7_), 
      legend.text=element_text(size=input$legendItemSize__7_),
      legend.key = element_rect(size = input$legendKeySize__7_),
      legend.key.size = unit(input$legendKeySize__7_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__7_),
          axis.title=element_text(size=input$textFont__7_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste( input$title__7_)) +
    xlab(input$xLabel__7_) + ylab(input$yLabel__7_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) 
  
  if( ! is.na(input$plotWidth__7_) & ! is.na(input$plotHeight__7_))
    ggplotly(plot, tooltip = c("nightly_price"), session="knitr", width = input$plotWidth__7_, height = input$plotHeight__7_)
  else
    ggplotly(plot, tooltip = c("nightly_price"), session="knitr") 
})
# ---------------------------------------------------------
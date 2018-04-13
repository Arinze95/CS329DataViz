# Change all __6_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__6_ <- downloadHandler(
  filename = function(){"Histogram.csv"}, 
  content = function(fname){
    write.csv(dfA1derek(), fname)
  }
)
output$table__6_ <- renderDataTable({
  DT::datatable(dfA1derek() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Histogram__6_ <- renderPlotly({
  plot = dfA1derek() %>% ggplot() + 
    geom_histogram(mapping = aes(x=population_proportion_under_15, colour = region, fill = region), binwidth = 5) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__6_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__6_), 
      legend.text=element_text(size=input$legendItemSize__6_),
      legend.key = element_rect(size = input$legendKeySize__6_),
      legend.key.size = unit(input$legendKeySize__6_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__6_),
          axis.title=element_text(size=input$textFont__6_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste( input$title__6_)) +
    xlab(input$xLabel__6_) + ylab(input$yLabel__6_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__6_)
  
  if( ! is.na(input$plotWidth__6_) & ! is.na(input$plotHeight__6_))
    ggplotly(plot, tooltip = c("population_proportion_under_15"), session="knitr", width = input$plotWidth__6_, height = input$plotHeight__6_)
  else
    ggplotly(plot, tooltip = c("population_proportion_under_15"), session="knitr") 
})
# ---------------------------------------------------------
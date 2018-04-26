# Change all __10_s, Download information, and edit the plot and ggplotly arguments below:

# Build Download Button and Output DataTable---------------
output$download__10_ <- downloadHandler(
  filename = function(){"CategoryBoxplot.csv"}, 
  content = function(fname){
    write.csv(dfA1Orji(), fname)
  }
)
output$table__10_ <- renderDataTable({
  DT::datatable(dfA1Orji() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$Histogram__10_ <- renderPlotly({
  plot = dfA1Orji() %>% ggplot() + geom_bar(mapping = aes(x=region, y=avgpatent, colour=region, fill=region), stat = "identity") +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__10_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__10_), 
      legend.text=element_text(size=input$legendItemSize__10_),
      legend.key = element_rect(size = input$legendKeySize__10_),
      legend.key.size = unit(input$legendKeySize__10_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__10_),
          axis.title=element_text(size=input$textFont__10_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste( input$title__10_)) +
    xlab(input$xLabel__10_) + ylab(input$yLabel__10_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__10_)
  
  if( ! is.na(input$plotWidth__10_) & ! is.na(input$plotHeight__10_))
    ggplotly(plot, tooltip = c("HAIL"), session="knitr", width = input$plotWidth__10_, height = input$plotHeight__10_)
  else
    ggplotly(plot, tooltip = c("HAIL"), session="knitr") 
})
# ---------------------------------------------------------

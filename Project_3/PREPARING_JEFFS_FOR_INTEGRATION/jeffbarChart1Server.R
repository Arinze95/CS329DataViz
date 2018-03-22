# Change all __3_s, Download information, and edit the plot and ggplotly arguments below:

# Build Download Button and Output DataTable---------------
  output$download__3_ <- downloadHandler(
    filename = function(){"CategoryBoxplot.csv"}, 
    content = function(fname){
      write.csv(dfA1Jeff(), fname)
    }
  )
  output$table__3_ <- renderDataTable({
    DT::datatable(dfA1Jeff() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__3_ <- renderPlotly({
    plot = dfA1Jeff() %>% ggplot() + geom_bar(mapping = aes(x=region, y=Average, colour=system_of_government, fill=system_of_government), stat = "identity") +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__3_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__3_), 
        legend.text=element_text(size=input$legendItemSize__3_),
        legend.key = element_rect(size = input$legendKeySize__3_),
        legend.key.size = unit(input$legendKeySize__3_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__3_),
            axis.title=element_text(size=input$textFont__3_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__3_)) +
      xlab(input$xLabel__3_) + ylab(input$yLabel__3_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__3_)
    
    if( ! is.na(input$plotWidth__3_) & ! is.na(input$plotHeight__3_))
     ggplotly(plot, tooltip = c("HALE"), session="knitr", width = input$plotWidth__3_, height = input$plotHeight__3_)
    else
      ggplotly(plot, tooltip = c("HALE"), session="knitr") 
  })
# ---------------------------------------------------------

  #replaced _1 with _1
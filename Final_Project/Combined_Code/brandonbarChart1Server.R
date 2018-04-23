# Change all __88_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__88_ <- downloadHandler(
    filename = function(){"QuarterBoxPlot.csv"}, 
    content = function(fname){
      write.csv(dfA3(), fname)
    }
  )
  output$table__88_ <- renderDataTable({
    DT::datatable(dfC1derek() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Density__88_ <- renderPlotly({
    plot = dfA3()  %>% ggplot() + geom_bar(mapping = aes(x= region, y= contraceptive_prevalence_residual, colour=region, fill=region), stat = "identity") +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__88_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__88_), 
        legend.text=element_text(size=input$legendItemSize__88_),
        legend.key = element_rect(size = input$legendKeySize__88_),
        legend.key.size = unit(input$legendKeySize__88_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__88_),
            axis.title=element_text(size=input$textFont__88_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__88_)) +
      xlab(input$xLabel__88_) + ylab(input$yLabel__88_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__88_)
    
    if( ! is.na(input$plotWidth__88_) & ! is.na(input$plotHeight__88_))
     ggplotly(plot, tooltip = c("sales"), session="knitr", width = input$plotWidth__88_, height = input$plotHeight__88_)
    else
      ggplotly(plot, tooltip = c("sales"), session="knitr") 
  })
# ---------------------------------------------------------

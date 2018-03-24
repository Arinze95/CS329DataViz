# Change all __8_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__8_ <- downloadHandler(
    filename = function(){"QuarterBoxPlot.csv"}, 
    content = function(fname){
      write.csv(dfC1derek(), fname)
    }
  )
  output$table__8_ <- renderDataTable({
    DT::datatable(dfC1derek() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Density__8_ <- renderPlotly({
    plot = dfC1derek() %>% dplyr::mutate(Dependentpercent = pop15 + pop60) %>% dplyr::mutate(independentpercent = 100 - Dependentpercent) %>% dplyr::mutate(DependentRatio = Dependentpercent/independentpercent) %>% ggplot() + geom_bar(mapping = aes(x= region, y= DependentRatio, colour=region, fill=region), stat = "identity") +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__8_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__8_), 
        legend.text=element_text(size=input$legendItemSize__8_),
        legend.key = element_rect(size = input$legendKeySize__8_),
        legend.key.size = unit(input$legendKeySize__8_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__8_),
            axis.title=element_text(size=input$textFont__8_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__8_)) +
      xlab(input$xLabel__8_) + ylab(input$yLabel__8_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__8_)
    
    if( ! is.na(input$plotWidth__8_) & ! is.na(input$plotHeight__8_))
     ggplotly(plot, tooltip = c("sales"), session="knitr", width = input$plotWidth__8_, height = input$plotHeight__8_)
    else
      ggplotly(plot, tooltip = c("sales"), session="knitr") 
  })
# ---------------------------------------------------------

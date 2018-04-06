# Change all __5_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__5_ <- downloadHandler(
    filename = function(){"Histogram.csv"}, 
    content = function(fname){
      write.csv(dfA1(), fname)
    }
  )
  output$table__5_ <- renderDataTable({
    DT::datatable(dfA1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__5_ <- renderPlotly({
    plot = dfA1() %>% ggplot() + 
      geom_histogram(mapping = aes(x=avg_total_income, colour = city, fill = city), binwidth = 50) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__5_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__5_), 
        legend.text=element_text(size=input$legendItemSize__5_),
        legend.key = element_rect(size = input$legendKeySize__5_),
        legend.key.size = unit(input$legendKeySize__5_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__5_),
            axis.title=element_text(size=input$textFont__5_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(input$title__5_)) +
      xlab(input$xLabel__5_) + ylab(input$yLabel__5_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__5_)
    
    if( ! is.na(input$plotWidth__5_) & ! is.na(input$plotHeight__5_))
     ggplotly(plot, tooltip = c("avg_total_income"), session="knitr", width = input$plotWidth__5_, height = input$plotHeight__5_)
    else
      ggplotly(plot, tooltip = c("avg_total_income"), session="knitr") 
  })
# ---------------------------------------------------------

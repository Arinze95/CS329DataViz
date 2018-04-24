# Change all __89_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__89_ <- downloadHandler(
    filename = function(){"WHO_Data3.csv"}, 
    content = function(fname){
      write.csv(dfA4(), fname)
    }
  )
  output$table__89_ <- renderDataTable({
    DT::datatable(dfA4() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__89_ <- renderPlotly({
    plot = dfA4() %>% ggplot() + 
      geom_point(mapping = aes(x=income_per_person, y=contraceptive_prevalence, colour=country)) +
      geom_smooth(aes(y=contraceptive_prevalence, x=income_per_person, colour=region), method = lm, formula = y ~ x, se=FALSE) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__89_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__89_), 
        legend.text=element_text(size=input$legendItemSize__89_),
        legend.key = element_rect(size = input$legendKeySize__89_),
        legend.key.size = unit(input$legendKeySize__89_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__89_),
            axis.title=element_text(size=input$textFont__89_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__89_)) +
      xlab(input$xLabel__89_) + ylab(input$yLabel__89_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__89_)
    
    if( ! is.na(input$plotWidth__89_) & ! is.na(input$plotHeight__89_))
     ggplotly(plot, tooltip = c("population_in_thousands_total"), session="knitr", width = input$plotWidth__89_, height = input$plotHeight__89_)
    else
      ggplotly(plot, tooltip = c("contraceptive_prevalence, income_per_person"), session="knitr") 
  })
# ---------------------------------------------------------

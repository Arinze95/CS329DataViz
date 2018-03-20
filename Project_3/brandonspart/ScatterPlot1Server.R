# Change all __1_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__1_ <- downloadHandler(
    filename = function(){"ScatterPlot.csv"}, 
    content = function(fname){
      write.csv(dfA1(), fname)
    }
  )
  output$table__1_ <- renderDataTable({
    DT::datatable(dfA1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__1_ <- renderPlotly({
    plot = dfA1() %>% ggplot() + 
      geom_point(mapping = aes(x=total_expenditure_on_health_as_percentage_of_gross_domestic_product, y=contraceptive_prevalence, colour=country)) +
      geom_smooth(aes(y=contraceptive_prevalence, x=total_expenditure_on_health_as_percentage_of_gross_domestic_product, colour=country), method = lm, formula = y ~ x, se=TRUE) +
      
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
      ggtitle(paste(SystemsOfGovernment(), input$title__1_)) +
      xlab(input$xLabel__1_) + ylab(input$yLabel__1_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__1_)
    
    if( ! is.na(input$plotWidth__1_) & ! is.na(input$plotHeight__1_))
     ggplotly(plot, tooltip = c("population_in_thousands_total"), session="knitr", width = input$plotWidth__1_, height = input$plotHeight__1_)
    else
      ggplotly(plot, tooltip = c("contraceptive_prevalence, total_expenditure_on_health_as_percentage_of_gross_domestic_product"), session="knitr") 
  })
# ---------------------------------------------------------

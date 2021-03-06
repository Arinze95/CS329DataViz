# Change all __j3_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__j3_ <- downloadHandler(
    filename = function(){"ScatterPlot.csv"}, 
    content = function(fname){
      write.csv(jeffdfC1(), fname)
    }
  )
  output$table__j3_ <- renderDataTable({
    DT::datatable(jeffdfC1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__j3_ <- renderPlotly({
    plot = jeffdfC1() %>% ggplot() + 
      geom_point(mapping = aes(x=contraceptive_prevalence, y=population_median_age_years)) +
      geom_smooth(aes(y=population_median_age_years, x=contraceptive_prevalence), method = lm, formula = y ~ x, se=TRUE) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__j3_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__j3_), 
        legend.text=element_text(size=input$legendItemSize__j3_),
        legend.key = element_rect(size = input$legendKeySize__j3_),
        legend.key.size = unit(input$legendKeySize__j3_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__j3_),
            axis.title=element_text(size=input$textFont__j3_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__j3_)) +
      xlab(input$xLabel__j3_) + ylab(input$yLabel__j3_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__j3_)
    
    if( ! is.na(input$plotWidth__j3_) & ! is.na(input$plotHeight__j3_))
     ggplotly(plot, tooltip = c("contraceptive_prevalence,population_median_age_years"), session="knitr", width = input$plotWidth__j3_, height = input$plotHeight__j3_)
    else
      ggplotly(plot, tooltip = c("contraceptive_prevalence,population_median_age_years"), session="knitr") 
  })
# ---------------------------------------------------------

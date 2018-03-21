# Change all __0_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__0_ <- downloadHandler(
    filename = function(){"WHO_Data2.csv"}, 
    content = function(fname){
      write.csv(dfA0(), fname)
    }
  )
  output$table__0_ <- renderDataTable({
    DT::datatable(dfA0() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__0_ <- renderPlotly({
    plot = dfA0() %>% ggplot() + 
      geom_point(mapping = aes(x=total_expenditure_on_health_as_percentage_of_gross_domestic_product, y=life_expectancy_at_birth_years_both_sexes, colour=country)) +
      geom_smooth(aes(y=life_expectancy_at_birth_years_both_sexes, x=total_expenditure_on_health_as_percentage_of_gross_domestic_product, colour=system_of_government), method = lm, formula = y ~ x, se=FALSE) +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__0_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__0_), 
        legend.text=element_text(size=input$legendItemSize__0_),
        legend.key = element_rect(size = input$legendKeySize__0_),
        legend.key.size = unit(input$legendKeySize__0_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__0_),
            axis.title=element_text(size=input$textFont__0_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__0_)) +
      xlab(input$xLabel__0_) + ylab(input$yLabel__0_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__0_)
    
    if( ! is.na(input$plotWidth__0_) & ! is.na(input$plotHeight__0_))
     ggplotly(plot, tooltip = c("population_in_thousands_total "), session="knitr", width = input$plotWidth__0_, height = input$plotHeight__0_)
    else
      ggplotly(plot, tooltip = c("life_expectancy_at_birth_years_both_sexes, total_expenditure_on_health_as_percentage_of_gross_domestic_product"), session="knitr") 
  })
# ---------------------------------------------------------

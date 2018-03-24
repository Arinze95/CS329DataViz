# Change all __9_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
output$download__9_ <- downloadHandler(
  filename = function(){"WHO_Cleanest.csv"}, 
  content = function(fname){
    write.csv(df1kyle(), fname)
  }
)
output$table__9_ <- renderDataTable({
  DT::datatable(df1kyle() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
  )
})
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
output$BoxPlotPlot__9_ <- renderPlotly({
  plot = df1kyle() %>% ggplot() + 
    geom_boxplot(mapping = aes(x = region, y = gross_national_income_per_capita_ppp_international, colour = system_of_government)) +
    
    theme_bw() +
    theme(plot.title = element_text(size = input$titleFont__9_, face = "bold")) + 
    theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
      legend.title=element_text(size=input$legendTitleSize__9_), 
      legend.text=element_text(size=input$legendItemSize__9_),
      legend.key = element_rect(size = input$legendKeySize__9_),
      legend.key.size = unit(input$legendKeySize__9_, 'lines')) +
    theme(axis.text=element_text(size=input$textFont__9_),
          axis.title=element_text(size=input$textFont__9_, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))  +
    theme(plot.margin=unit(c(2,2,2,2),"cm")) +
    scale_y_continuous(labels = scales::comma) + # Disable scientific notation
    ggtitle(paste(input$title__9_)) + #ggtitle(paste(Hospital_Regions(), input$title__9_)) +
    xlab(input$xLabel__9_) + ylab(input$yLabel__9_) +
    theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
    scale_color_discrete(name = input$legendTitle__9_)
  
  if( ! is.na(input$plotWidth__9_) & ! is.na(input$plotHeight__9_))
    ggplotly(plot, tooltip = c("region", "gross_national_income_per_capita_ppp_international"), session="knitr", width = input$plotWidth__9_, height = input$plotHeight__9_)
  else
    ggplotly(plot, tooltip = c("region", "gross_national_income_per_capita_ppp_international"), session="knitr") 
})
# ---------------------------------------------------------

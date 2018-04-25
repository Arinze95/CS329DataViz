# Change all __j2_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__j2_ <- downloadHandler(
    filename = function(){"CategoryBoxplot.csv"}, 
    content = function(fname){
      write.csv(jeffdfB1(), fname)
    }
  )
  output$table__j2_ <- renderDataTable({
    DT::datatable(jeffdfB1() , rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__j2_ <- renderPlotly({
    plot = jeffdfB1() %>% ggplot() + geom_bar(mapping = aes(x=region, y=Average,colour=system_of_government, fill=system_of_government), stat = "identity") +
      
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__j2_, face = "bold")) + 
      theme( # Legend Attributes - see https://github.com/tidyverse/ggplot2/wiki/Legend-Attributes
        legend.title=element_text(size=input$legendTitleSize__j2_), 
        legend.text=element_text(size=input$legendItemSize__j2_),
        legend.key = element_rect(size = input$legendKeySize__j2_),
        legend.key.size = unit(input$legendKeySize__j2_, 'lines')) +
      theme(axis.text=element_text(size=input$textFont__j2_),
            axis.title=element_text(size=input$textFont__j2_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste( input$title__j2_)) +
      xlab(input$xLabel__j2_) + ylab(input$yLabel__j2_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__j2_)
    
    if( ! is.na(input$plotWidth__j2_) & ! is.na(input$plotHeight__j2_))
     ggplotly(plot, tooltip = c("Expenditure"), session="knitr", width = input$plotWidth__j2_, height = input$plotHeight__j2_)
    else
      ggplotly(plot, tooltip = c("Expenditure"), session="knitr") 
  })
# ---------------------------------------------------------

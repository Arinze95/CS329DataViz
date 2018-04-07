# Change "boxplot1", all __1_s, and edit tiles below:
tabItem(tabName = "boxplot2",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__2_'),
                   downloadButton('download__2_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__2_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__2_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__2_", "Title 2", "Average Income per Zip Code"),
                   numericInput("titleFont__2_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__2_", "Legend Title", "Type of Property"),
                   numericInput("legendTitleSize__2_", "Legend Title Size", 8),
                   numericInput("legendItemSize__2_", "Legend Item Size", 5), #both 10
                   numericInput("legendKeySize__2_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__2_", "x-Axis Label", "City"),
                   textInput("yLabel__2_", "y-Axis Label 2", "Average Income per Zip Code"),
                   numericInput("textFont__2_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__2_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__2_", "yData Maximum (Required)", NA))),
        plotlyOutput("BoxPlotPlot__2_", height=800)
)

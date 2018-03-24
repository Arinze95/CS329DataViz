# Change "boxplot1", all __9_s, and edit tiles below:
tabItem(tabName = "boxplot1",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__9_'),
                   downloadButton('download__9_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__9_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__9_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__9_", "Title 1", "Gross income per capita"),
                   numericInput("titleFont__9_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__9_", "Legend Title", "System of Government"),
                   numericInput("legendTitleSize__9_", "Legend Title Size", 8),
                   numericInput("legendItemSize__9_", "Legend Item Size", 5), #both 10
                   numericInput("legendKeySize__9_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__9_", "x-Axis Label", "Region"),
                   textInput("yLabel__9_", "y-Axis Label 1", "Gross income per capita"),
                   numericInput("textFont__9_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__9_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__9_", "yData Maximum (Required)", NA))),
        plotlyOutput("BoxPlotPlot__9_", height=800)
)

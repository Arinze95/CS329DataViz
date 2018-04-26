# Change "Histogram", all __10_s, and edit tiles below:
tabItem(tabName = "barchert",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__10_'),
                   downloadButton('download__10_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__10_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__10_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__10_", "Title 1", "Average Number of Patents Issued in a Year per Region"),
                   numericInput("titleFont__10_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__10_", "Legend Title", "Regions"),
                   numericInput("legendTitleSize__10_", "Legend Title Size", 8), #was 10,8,5
                   numericInput("legendItemSize__10_", "Legend Item Size", 5),
                   numericInput("legendKeySize__10_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__10_", "x-Axis Label", "Region"),
                   textInput("yLabel__10_", "y-Axis Label 1", "Average Number of Patents"),
                   numericInput("textFont__10_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__10_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__10_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__10_", height=800)
)

#reokaced _1 with _1


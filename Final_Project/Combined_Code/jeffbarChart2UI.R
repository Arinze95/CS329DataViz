# Change "Histogram", all __4_s, and edit tiles below:
tabItem(tabName = "Barchart",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__4_'),
             downloadButton('download__4_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__4_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__4_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__4_", "Title 1", "Median Age by Region"),
             numericInput("titleFont__4_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__4_", "Legend Title", "Regions"),
             numericInput("legendTitleSize__4_", "Legend Title Size", 8), #was 10,8,5
             numericInput("legendItemSize__4_", "Legend Item Size", 5),
             numericInput("legendKeySize__4_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
             textInput("xLabel__4_", "x-Axis Label", "Region"),
             textInput("yLabel__4_", "y-Axis Label 1", "Average Median Age"),
             numericInput("textFont__4_", "textFont", 10)),
          tabPanel("Data Size", 
             numericInput("yDataMin__4_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__4_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__4_", height=800)
)

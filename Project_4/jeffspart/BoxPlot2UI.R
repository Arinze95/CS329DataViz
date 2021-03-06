# Change "Histogram", all __3_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__3_'),
             downloadButton('download__3_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__3_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__3_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__3_", "Title 1", "Avg Total Income"),
             numericInput("titleFont__3_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__3_", "Legend Title", ""),
             numericInput("legendTitleSize__3_", "Legend Title Size", 10), #was 5,5,5
             numericInput("legendItemSize__3_", "Legend Item Size", 6),
             numericInput("legendKeySize__3_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
             textInput("xLabel__3_", "x-Axis Label", "Cities"),
             textInput("yLabel__3_", "y-Axis Label 1", "Avg Total Income"),
             numericInput("textFont__3_", "textFont", 10)),
          tabPanel("Data Size", 
             numericInput("yDataMin__3_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__3_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__3_", height=800)
)

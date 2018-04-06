# Change "Histogram", all __6_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__6_'),
             downloadButton('download__6_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__6_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__6_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__6_", "Title 1", "Review Score Ratings"),
             numericInput("titleFont__6_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__6_", "Legend Title", ""),
             numericInput("legendTitleSize__6_", "Legend Title Size", 10), #was 5,5,5
             numericInput("legendItemSize__6_", "Legend Item Size", 6),
             numericInput("legendKeySize__6_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
             textInput("xLabel__6_", "x-Axis Label", "Cities"),
             textInput("yLabel__6_", "y-Axis Label 1", "Review Score Ratings"),
             numericInput("textFont__6_", "textFont", 10)),
          tabPanel("Data Size", 
             numericInput("yDataMin__6_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__6_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__6_", height=800)
)

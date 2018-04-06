# Change "Histogram", all __5_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__5_'),
             downloadButton('download__5_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__5_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__5_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__5_", "Title 1", "Nightly Prices by City"),
             numericInput("titleFont__5_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__5_", "Legend Title", "Cities"),
             numericInput("legendTitleSize__5_", "Legend Title Size", 10),
             numericInput("legendItemSize__5_", "Legend Item Size", 10),
             numericInput("legendKeySize__5_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__5_", "x-Axis Label", "Nightly Prices"),
             textInput("yLabel__5_", "y-Axis Label 1", "Nightly Prices Count"),
             numericInput("textFont__5_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__5_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__5_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__5_", height=800)
)

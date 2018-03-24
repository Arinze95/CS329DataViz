# Change "Density", all __8_s, and edit tiles below:
tabItem(tabName = "Density",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__8_'),
             downloadButton('download__8_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__8_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__8_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__8_", "Title 1", "Age Dependency Ratio by Region"),
             numericInput("titleFont__8_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__8_", "Legend Title", "Region"),
             numericInput("legendTitleSize__8_", "Legend Title Size", 10),
             numericInput("legendItemSize__8_", "Legend Item Size", 10),
             numericInput("legendKeySize__8_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__8_", "x-Axis Label", "Region"),
             textInput("yLabel__8_", "y-Axis Label 1", "Age Dependency Ratio"),
             numericInput("textFont__8_", "textFont", 10)),
          tabPanel("Data Size", 
                 numericInput("yDataMin__8_", "yData Minimum (Required)", 0),
                 numericInput("yDataMax__8_", "yData Maximum (Required)", NA))),
        plotlyOutput("Density__8_", height=800)
)

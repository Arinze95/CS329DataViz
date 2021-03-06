# Change "Density", all __7_s, and edit tiles below:
tabItem(tabName = "Density",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__7_'),
             downloadButton('download__7_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__7_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__7_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__7_", "Title 1", "Gross National Income per Capita by Region"),
             numericInput("titleFont__7_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__7_", "Legend Title", "Region"),
             numericInput("legendTitleSize__7_", "Legend Title Size", 10),
             numericInput("legendItemSize__7_", "Legend Item Size", 8),
             numericInput("legendKeySize__7_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__7_", "x-Axis Label", "Region"),
             textInput("yLabel__7_", "y-Axis Label 1", "Gross National Income per Capita"),
             numericInput("textFont__7_", "textFont", 10)),
          tabPanel("Data Size", 
                 numericInput("yDataMin__7_", "yData Minimum (Required)", 0),
                 numericInput("yDataMax__7_", "yData Maximum (Required)", NA))),
        plotlyOutput("Density__7_", height=800)
)

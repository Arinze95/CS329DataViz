# Change "boxplot1", all __1_s, and edit tiles below:
tabItem(tabName = "boxplot1",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__1_'),
             downloadButton('download__1_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__1_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__1_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__1_", "Title 1", "Average Total Payment by Disease"),
             numericInput("titleFont__1_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__1_", "Legend Title", "Hospital Regions"),
             numericInput("legendTitleSize__1_", "Legend Title Size", 10),
             numericInput("legendItemSize__1_", "Legend Item Size", 10),
             numericInput("legendKeySize__1_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__1_", "x-Axis Label", "Diseases"),
             textInput("yLabel__1_", "y-Axis Label 1", "Average Total Payments"),
             numericInput("textFont__1_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__1_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__1_", "yData Maximum (Required)", NA))),
        plotlyOutput("BoxPlotPlot__1_", height=800)
)

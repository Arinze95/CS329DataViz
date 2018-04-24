# Change "Histogram", all __j3_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__j3_'),
             downloadButton('download__j3_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__j3_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__j3_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__j3_", "Title 1", "Contraceptive Prevalence vs. Median Age"),
             numericInput("titleFont__j3_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__j3_", "Legend Title", "Regions"),
             numericInput("legendTitleSize__j3_", "Legend Title Size", 10),
             numericInput("legendItemSize__j3_", "Legend Item Size", 10),
             numericInput("legendKeySize__j3_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__j3_", "x-Axis Label", "Contraceptive Prevalence"),
             textInput("yLabel__j3_", "y-Axis Label 1", "Median Age"),
             numericInput("textFont__j3_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__j3_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__j3_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__j3_", height=800)
)

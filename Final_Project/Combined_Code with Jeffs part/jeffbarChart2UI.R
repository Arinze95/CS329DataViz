# Change "Histogram", all __j2_s, and edit tiles below:
tabItem(tabName = "Barchart",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__j2_'),
             downloadButton('download__j2_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__j2_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__j2_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__j2_", "Title 1", "Median Age"),
             numericInput("titleFont__j2_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__j2_", "Legend Title", "System of Gov."),
             numericInput("legendTitleSize__j2_", "Legend Title Size", 10),
             numericInput("legendItemSize__j2_", "Legend Item Size", 10),
             numericInput("legendKeySize__j2_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__j2_", "x-Axis Label", "Regions"),
             textInput("yLabel__j2_", "y-Axis Label 1", "Median Age"),
             numericInput("textFont__j2_", "textFont", 10)),
          tabPanel("Data Size", 
             numericInput("yDataMin__j2_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__j2_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__j2_", height=800)
)

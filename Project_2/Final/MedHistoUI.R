# Change "Histogram", all __4_s, and edit tiles below:
tabItem(tabName = "histo2",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
                   dataTableOutput('table__4_'),
                   downloadButton('download__4_',"Download the data")),
          tabPanel("Plot Size", 
                   numericInput("plotWidth__4_", "Plot Width (Required)", 1000),
                   numericInput("plotHeight__4_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
                   textInput("title__4_", "Title 1", "Region Shipping Costs"),
                   numericInput("titleFont__4_", "Title Font", 10)), 
          tabPanel("Plot Legend",
                   textInput("legendTitle__4_", "Legend Title", "Regions"),
                   numericInput("legendTitleSize__4_", "Legend Title Size", 10),
                   numericInput("legendItemSize__4_", "Legend Item Size", 10),
                   numericInput("legendKeySize__4_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
                   textInput("xLabel__4_", "x-Axis Label", "Shipping Costs"),
                   textInput("yLabel__4_", "y-Axis Label 1", "Shipping Costs Count"),
                   numericInput("textFont__4_", "textFont", 10)),
          tabPanel("Data Size", 
                   numericInput("yDataMin__4_", "yData Minimum (Required)", 0),
                   numericInput("yDataMax__4_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__4_", height=800)
)

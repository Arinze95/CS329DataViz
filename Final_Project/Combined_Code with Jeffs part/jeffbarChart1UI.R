# Change "Histogram", all __j1_s, and edit tiles below:
tabItem(tabName = "Barchart",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__j1_'),
             downloadButton('download__j1_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__j1_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__j1_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__j1_", "Title 1", "Contraceptive Prevalence by Region"),
             numericInput("titleFont__j1_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__j1_", "Legend Title", "System of Gov."),
             numericInput("legendTitleSize__j1_", "Legend Title Size", 10),
             numericInput("legendItemSize__j1_", "Legend Item Size", 10),
             numericInput("legendKeySize__j1_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__j1_", "x-Axis Label", "Regions"),
             textInput("yLabel__j1_", "y-Axis Label 1", "Contraceptive Prevalence"),
             numericInput("textFont__j1_", "textFont", 10)),
          tabPanel("Data Size", 
             numericInput("yDataMin__j1_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__j1_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__j1_", height=800)
)

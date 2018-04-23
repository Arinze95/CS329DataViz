# Change "Density", all __88_s, and edit tiles below:
tabItem(tabName = "Density",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__88_'),
             downloadButton('download__88_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__88_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__88_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__88_", "Title 1", "Average Contraceptive Prevalence Residual by Region"),
             numericInput("titleFont__88_", "Title Font", 10)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__88_", "Legend Title", ""),
             numericInput("legendTitleSize__88_", "Legend Title Size", 10), #was 10,10,5
             numericInput("legendItemSize__88_", "Legend Item Size", 5),
             numericInput("legendKeySize__88_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
             textInput("xLabel__88_", "x-Axis Label", "Region"),
             textInput("yLabel__88_", "y-Axis Label 1", "Average Contraceptive Prevalence Residual"),
             numericInput("textFont__88_", "textFont", 10)),
          tabPanel("Data Size", 
                 numericInput("yDataMin__88_", "yData Minimum (Required)", 0),
                 numericInput("yDataMax__88_", "yData Maximum (Required)", NA))),
        plotlyOutput("Density__88_", height=800)
)

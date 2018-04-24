# Change "Histogram", all __89_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__89_'),
             downloadButton('download__89_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__89_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__89_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__89_", "Title 1", "Contraceptive Prevalence vs Income Per Person by Country, System of Government"),
             numericInput("titleFont__89_", "Title Font", 8)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__89_", "Legend Title", "Country (dots), Regions (lines)"),
             numericInput("legendTitleSize__89_", "Legend Title Size", 6), #was 8,6,5
             numericInput("legendItemSize__89_", "Legend Item Size", 4),
             numericInput("legendKeySize__89_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
             textInput("xLabel__89_", "x-Axis Label", "Income Per Person by Country (USD)"),
             textInput("yLabel__89_", "y-Axis Label 1", "Contraceptive Prevelance (% population with access)"),
             numericInput("textFont__89_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__89_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__89_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__89_", height=800)
)

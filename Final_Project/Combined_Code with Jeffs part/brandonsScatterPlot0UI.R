# Change "Histogram", all __0_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__0_'),
             downloadButton('download__0_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__0_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__0_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__0_", "Title 1", "Life Expectancy vs Health Expenditure by Country, System of Government"),
             numericInput("titleFont__0_", "Title Font", 8)), 
          tabPanel("Plot Legend",
             textInput("legendTitle__0_", "Legend Title", "Country (dots), Government (lines) "),
             numericInput("legendTitleSize__0_", "Legend Title Size", 6), #was 8,6,5
             numericInput("legendItemSize__0_", "Legend Item Size", 4),
             numericInput("legendKeySize__0_", "Legend Key Size", 2)), 
          tabPanel("Axis Labels",
             textInput("xLabel__0_", "x-Axis Label", "Health Expenditure (% of GDP) "),
             textInput("yLabel__0_", "y-Axis Label 1", "Life Expectancy"),
             numericInput("textFont__0_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__0_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__0_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__0_", height=800)
)

library(tidyverse)
library(shiny)

dietSet <- read_delim("diet/Fat_Supply_Quantity_Data.csv")

selectedSet <- dietSet %>% 
  select(Country, Meat, Confirmed, Deaths, Recovered)

ui <- fluidPage(
  titlePanel("Non-vegetarian Diet"),
  tabsetPanel(
    tabPanel("Summary", 
             h1("Country Diet Data Set"),
             p("First, the data set I am working with contains", strong(nrow(selectedSet)), "rows of values. This interactive web page will displays a collection of values that 
             determines if non-vegetarian diet or vegetarian diet has an effect on the health of an individual that has had", strong("COVID-19"), ".
             The purpose of this interactive program is to provide the user awareness about the different impact that certain diets may bring", em("post-COVID symptoms.")), 
             dataTableOutput(("sample"))
    ),
    tabPanel("Plot", 
             sidebarLayout(
               sidebarPanel(
                 sliderInput("n", "Number of Recovery:",
                             min = 0,
                             max = 100,
                             value = 10),
                 radioButtons("colors", label = h3("Color Options"),
                              choices = list("Choice 1" = "red", "Choice 2" = "blue")
                 ),
               ),

               mainPanel(
                 plotOutput("plot"),
                 textOutput("plotSummary")
               )
             )
    ),
    tabPanel("Table",
             sidebarPanel(
               selectInput(inputId = "Country",
                           label = "Select Country:",
                           choices = unique(dietSet$Country)
                           
               ),
             ),
             mainPanel(
               tableOutput("table"),
               textOutput("summary")
             )
    )
  )
)


server <- function(input, output) {
  output$plot <- renderPlot ({
    dietSet %>% 
      sample_n(input$n) %>% 
      ggplot(aes(Meat, Recovered, size = Recovered, color = Recovered)) +
      geom_point() +
      labs(title = "COVID Recovered vs. Vegetables Comsumption") +
      scale_color_gradient(low = "black", high = input$colors)
    
  })
  
  filterData <- reactive ({
    dietSet %>% 
    filter(Country == input$Country) %>% 
      select(Country, Meat, Recovered)
  })
  
  output$table <- renderTable ({
      filterData()
  })
  
  output$summary <- renderText ({
    if(!is.null(input$Country)) {
      paste("You selected", input$Country, "and the recovery is", round((filterData()$Recovered * 100), 2), "%")
    }
  })
  
  output$plotSummary <- renderText ({
    paste("You selected", input$n, "values")
  })
  
  output$sample <- renderDataTable({
    selectedSet %>% 
      sample_n(6)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

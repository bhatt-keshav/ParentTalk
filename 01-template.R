library(shiny)

ui <-
  fluidPage(
    sliderInput(
      inputId = 'sldr',
      label = 'choose a num',
      min = 10,
      max = 50,
      value = 12,
      ticks = TRUE,
      animate = FALSE),
    plotOutput(outputId = 'hizt')
    )

server <- function(input, output) {
  output$hizt <- renderPlot({
    hist(rnorm(input$sldr))
  })
  
}

shinyApp(ui = ui, server = server)


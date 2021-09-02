library(shiny)

ui <-
  fluidPage(
    numericInput(
      inputId = 'weeks_pregnant',
      label = 'How many weeks is she pregnant?',
      value = 1),
    textOutput(outputId = 'pc_complete')
    )

server <- function(input, output) {
  output$pc_complete <- renderText({
    paste0('Pregancy complete = ' ,input$weeks_pregnant*100/40, '%')
  })
}

shinyApp(ui = ui, server = server)


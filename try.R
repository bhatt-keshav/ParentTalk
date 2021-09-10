library(shiny)

ui <- navbarPage(title = "",
                 tabPanel(title = "Pregnancy",
                          tags$h1(strong("Project Description")),
                          hr()
                 ),
                 tabPanel(title = "Baby",
                          'bla bla')
)

server <- function(input, output) {
}

shinyApp(server = server, ui = ui)
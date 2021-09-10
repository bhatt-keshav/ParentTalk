library(shiny)

ui <- navbarPage(title = "",
                 ## Tab 1: Mama Bear
                 tabPanel(title = "Pregnancy",
                          h2('Pregnancy Related Durations'),
                          fluidPage(
                            # Row 1: Input for pregnancy in weeks
                            fluidRow(
                            column(
                              width = 4, 
                              numericInput(inputId = "weeks_pr",
                              label = strong("How many weeks is the pregnancy?"),
                              value = 1)
                              ),
                           column(
                             width = 3,
                             strong('Pregnancy in months is:'),
                             tags$i(h4(textOutput(outputId = 'convert_weeks_months')))
                                  )
                                ), 
                           hr(),
                           
                           # Row 2: Input for conception date --> weeks pregnant
                           fluidRow(
                             column(
                               width = 4,
                               dateInput(inputId = "conc_date", 
                                         label = strong(("When was the conception?")), 
                                         value = Sys.Date())
                                    ),
                             column(
                               width = 3,
                               strong('Pregnancy in weeks is:'),
                               tags$i(h4(textOutput(outputId = 'convert_conc_weeks')))
                                    ),
                             column(
                               width = 3,
                               strong('Expected Delivery Date is:'),
                               tags$i(h4(textOutput(outputId = 'conc_weeks_del_dt')))
                             )
                             ),
                             
                             # Row 3: Input for last period date --> weeks pregnant
                             fluidRow(
                               column(
                                 width = 4,
                                 dateInput(inputId = "pd_date", 
                                           label = strong(("The first day of your last period?")), 
                                           value = Sys.Date())
                                 ),
                               column(
                                 width = 3,
                                 strong('Pregnancy in weeks is:'),
                                 tags$i(h4(textOutput(outputId = 'convert_pd_weeks')))
                               ),
                               column(
                                 width = 3,
                                 strong('Expected Delivery Date is:'),
                                 tags$i(h4(textOutput(outputId = 'pd_weeks_del_dt')))
                               )
                               )
                                ) #fluidPage End
                              ) #tabPanel 1 End
                 ## Tab 2: Baby Bear
                ,tabPanel(title = "Baby", h2('Baby Age Related Durations'))
)
                

server <- function(input, output) {
  output$convert_weeks_months <- renderText({ input$weeks_pr * 7/30 })
  
  output$convert_conc_weeks <- renderText({ as.numeric(((Sys.Date() - input$conc_date)+14)/7) })
  output$conc_weeks_del_dt <- renderText({ as.character(format(input$conc_date + 266, 
                                                               '%a %d %b %Y')) })
  
  output$convert_pd_weeks <- renderText({ as.numeric(((Sys.Date() - input$pd_date))/7) })
  output$pd_weeks_del_dt <- renderText({ as.character(format(input$pd_date + 280, 
                                                             '%a %d %b %Y')) })
  
}

shinyApp(server = server, ui = ui)
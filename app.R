library(shiny)

# Mission 4: First GUI control panel

lab_data <- data.frame(
  subject_id = c("SUBJ001", "SUBJ002", "SUBJ003"),
  test_name  = c("ALT", "AST", "CRP"),
  result     = c(34, 41, 8.5),
  unit       = c("U/L", "U/L", "mg/L")
)

ui <- fluidPage(
  titlePanel("Lab Data Control Panel"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "selected_test",
        label = "Choose a lab test:",
        choices = lab_data$test_name
      )
    ),
    
    mainPanel(
      h3("Filtered Result"),
      tableOutput("filtered_table")
    )
  )
)

server <- function(input, output) {
  
  output$filtered_table <- renderTable({
    lab_data[lab_data$test_name == input$selected_test, ]
  })
  
}

shinyApp(ui = ui, server = server)

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  sidebarLayout(
    sidebarPanel(
      
      # Add button
      actionButton(inputId = "add.button", label = "Add", icon = icon("plus")), 
      
      # Delete button 
      actionButton(inputId = "delete.button", label = "Delete", icon = icon("minus")),
     
       # Row selection
      numericInput(inputId = "row.selection", label = "Select row to be deleted", min = 1, max = 100, value = "")
    ),
    mainPanel(
      verbatimTextOutput('text')
    )
  )
)
)


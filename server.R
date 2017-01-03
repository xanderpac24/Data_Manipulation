
library(shiny)

shinyServer(function(input, output) {

  values <- reactiveValues()
  values$df <- data.frame(v1 = 23,
                          v2 = 45,
                          v3 = 65,
                          v4 = 33,
                          v5 = 65,
                          v6 = 78,
                          v7 = 90,
                          v8 = 12
  )
  
  newEntry <- observe({
    cat("newEntry\n")
    if(input$add.button > 0) {
      new.value <- isolate(input$v1 * input$v2 * input$v3 * input$v4)
      
      newRow <- isolate(c(input$v1, input$v2, input$v3, input$v4, 
                          input$v5, input$v6, input$v7, new.value))
      
      isolate(values$df <- rbind(values$df,sample(1:8)))
    }
  })
  
  
  deleteEntry <- observe({
    cat("deleteEntry\n")
    if(input$delete.button > 0) {
      if(is.na(isolate(input$row.selection))){
        values$df <- isolate(values$df[-nrow(values$df), ])
      } else {
        values$df <- isolate(values$df[-input$row.selection, ])
      }
    }
    
  })
  
  output$text = renderPrint({
    values$df 
    
  })

})

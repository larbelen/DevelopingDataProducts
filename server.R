library(shiny)

shinyServer(
  
  function(input, output) {
    
    ## DEFINE REACTIVES
    
    colm <-reactive({
            as.numeric(input$var)
          })
          
          ## DEFINE OUTPUT PANEL SUMMARY
  
    output$sum <- renderPrint({
            summary(USArrests)
      
    })
    
      ## DEFINE OUTPUT PANEL STUCTURE
    
    output$str <- renderPrint({
          str(USArrests)
     
   })
    
    ## DEFINE OUTPUT PANEL DATA
    
     output$data <- renderTable({
      USArrests[colm()]
  
             }) 
             
               ## DEFINE OUTPUT PANEL PLOT
             
            output$myhist <- renderPlot({
          hist( USArrests[,colm()], breaks=seq(0, max(USArrests[,colm()], l=input$bins+1), col=input$color),col=input$color,main="Histogram of USArrests dataset", xlab=names(USArrests[colm()]))
        })
    
  })
  



# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
# hier moet de dataset en dergelijke zijn
# alle functies en input van ui

library(shiny)
library(ggplot2)
source("R/helperfunctions.R")
source("R/heisertransformfunctions.R")

shinyServer(function(input, output) {
    output$text1 <- renderText({ 
       paste(1-input$leftcorner -input$topcorner)
    })
    #currentprop <- sum(input$leftcorner, input$topcorner, input$rightcorner)
    output$text2 <- renderText({
        paste("The proportions are now left:", 
              input$leftcorner,"and top;", 
              input$topcorner, 
              "and right;",
              (1-input$leftcorner -input$topcorner))
    })

  output$distPlot <- renderPlot({
      triangles <- vertices_create(input$leftcorner, 
                                   input$topcorner,
                                   (1-input$leftcorner -input$topcorner))
      names(triangles) <- c("x", "y")
      g<-ggplot() +lines(triangles, x,y,"blue" )+ corners(triangles, x,y, size = 5) +theme_heiser
    print(g)

  })

}# end of shinyserver brackets
) #end of funciton

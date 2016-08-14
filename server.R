
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
  output$plotsecondpage <- renderPlot({
      ver <- CreateVertices(werepeople, "normal" ,"wererabbit","werewolf" )
      point <- Prob2Coord(werepeople, "normal" ,"wererabbit","werewolf", append = TRUE)
      #scaffolding 
      g <- ggplot()+ 
          lines(vert = ver, line_colour = "blue")+
          corners(ver) + 
          theme_heiser  +
          geom_point(data = point, aes_string("x","y", 
                                              color = input$coloroverlay), alpha = input$alpha)+
                       # sets the transparancy
          geom_point(data = centroidcalculator(point, input$centroid), 
                     aes_string("mx","my",size = "N", color = input$centroid),alpha = input$alpha2)
      print(g)
  })
  output$textthingy <- renderText(input$coloroverlay)

}# end of shinyserver brackets
) #end of funciton

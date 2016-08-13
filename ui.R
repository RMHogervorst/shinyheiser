
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
# hier de mogelijkheden om aan te zitten.

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Transformation player"),
  

  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
        h2("Basics behind Heiser 2004"),
    p("If we visualize the three proportions of a dataset as a distance
    on a three axis (x,y,z) then we can connect the three points
    inside the cube with lines. This intersection is a triangle as displayed here.
    If the proportions change then the shape of the triangle changes as well."),
  h3("Instructions"),
  p("use the two sliders to change the proportions, the third one will change
    automatically. Since proportions of a group can never exceed 1, the third
    proportion will be calculated automagically. Larger proportions pull the
    triangle towards them."),
        sliderInput("leftcorner",
                  "Proportion 1 (left):",
                  min = 0,
                  max = 1,
                  value = .3),
        sliderInput("topcorner",
                  "Proportion 2 (top):",
                  min = 0,
                  max = 1,
                  value = .3),
        
        textOutput("text2")
),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      p("Find more information in: Heiser, W. J. (2004). 
Geometric representation of association between categories. 
Psychometrika, 69(4), 513–545. http://doi.org/10.1007/bf02289854
 ")
    )
  )
))

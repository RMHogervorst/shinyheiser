
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
# hier de mogelijkheden om aan te zitten.

library(shiny)
shinyUI(navbarPage("Heiser transformation",
                   tabPanel("Introduction",
                            titlePanel("Introduction "),
                            mainPanel(
                                h3("This page describes the functionality of
this shiny app."),p("In many statistical prediction techniques the endresult is not
a clearcut answer but a probability of some classification. 
Today we handle the special case of three possible classes, and their probability.
                    When you have two outcomes, 2 dimensions, we can plot the probabilities 
                    into a 2 dimensional plot. When there are 3 outcomes we can view this
                    in a 3-dimensional plot. However this is very inpractical."),
p("There are multiple ways to plot three dimensions on a flat screen. 
  We can put three axis on one image such as in triplots (below). 
  However, distances between points are no longer euclidian."),
img(src = "http://www.lboro.ac.uk/microsites/research/phys-geog/tri-plot/fig1.png"),
p("Heiser (2004) shows another way to do this. by transforming the probabilities
  into a triangle with points closer to an corner with a larger probabilities."),
img(src="https://github.com/RMHogervorst/heisertransform/blob/master/README-unnamed-chunk-2-1.png"),
h3("What can we find in this shiny app?"),
p("On the next page (Proportion player) I display what happens when proportions change. 
  You can change the proportions to see what happens with the shape of the triangle"),
p("In the third page (Real world example) I show what you can do with these triangles.
  I created a dataset with probabilities that people are werewolf, wererabbit or normal.
  All these people have real properties such as BMI, personality measures and so forth.
  you can color the people by their properties and it is possible to place a dot at the central
  location of all the people with a certain property."),
p("This is an example website, a mock up I created for the course developing data projects for coursera. 
  You can find the code of this project in 
  <href='https://github.com/RMHogervorst/shinyheiser/'>my github page </a>.")
                                  
                            
                            )
                            ),
                   tabPanel("Proportions player",
    fluidPage(

  # Application title
  titlePanel("Changing proportions and their effect"),
  

  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
        h2("Basics behind Heiser 2004"),
    p("If we visualize the three proportions of a dataset as a distance
    on a three axis (x,y,z) then we can connect the three points
    inside the cube with lines. This intersection is a triangle as displayed here.
    If the proportions change then the shape of the triangle changes as well."),
    img(src='https://wm.math4allview.appspot.com/getresource?blob-key=AMIfv94aQ-VtHJmu9ksSUc4XDgaDu57A_ciFWUrjQYHT0-f9d69Gwpkzy7FBBRZ67kft2De_g1ClEqYHbVFXU6tqb8tLPOneQD0H2W2GF406xXB9KsWNTWNWQ1ED0ctsvWSgvJYTVQ0piF_waVA0UVX0JOIoKx3mxSCJoY8wz5TDst0Q7aM_heQ%0A', align = "center", width = "200px"),
  h3("Instructions"),
  p("use the two sliders to change the proportions, the third one will change
    automatically. Since proportions of a group can never exceed 1, the third
    proportion will be calculated automagically. Larger proportions pull the
    triangle towards them. I did not validate this app, so it is possible to 
    to have a negative value for the third category, which makes no sense. 
    You cannot have a negative probability."),
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
    ) # closes mainPanel
  ) # closes sidebar layout
)  # closes fluidpage

), # closes tabpale.
tabPanel("Real world applications",
         fluidPage(
             sidebarLayout(
                 sidebarPanel( 
                     h1("Details"),
                     #inputs for selection
                     selectInput("coloroverlay", "Color overlay:",
                                 c("day of the week"="weekday",
                                   "Sex"="sex",
                                   "Favorite food"="favorite_food",
                                   "Allergy"="allergies",
                                   "Ethnicity/race"="ethnicity",
                                   "Eye color"="eye_color",
                                   "Hair color"="haircolor",
                                   "Blood type"="blood_type",
                                   "Level of scratches"="scratch",
                                   "Level of itchiness"="itch",
                                   "Openness to experience"="BFI_O",
                                   "Conscienciousness"= "BFI_C")
                                 ),
                     sliderInput("alpha", "Transparancy", min = 0, max =1,value = .9)  ,
                     selectInput("centroid", "Type of centroid:",
                                 c("nothing"=NULL,
                                 "day of the week"="weekday",
                                 "Sex"="sex",
                                 "Favorite food"="favorite_food",
                                 "Allergy"="allergies",
                                 "Ethnicity/race"="ethnicity",
                                 "Eye color"="eye_color",
                                 "Hair color"="haircolor",
                                 "Blood type"="blood_type",
                                 "Level of scratches"="scratch",
                                 "Level of itchiness"="itch",
                                 "Openness to experience"="BFI_O",
                                 "Conscienciousness"= "BFI_C")),
                     sliderInput("alpha2", "Transparancy", min = 0, max =1,value = 0)
                     ),
                 mainPanel(
                     h2("Probability of being normal, werewolf, or wererabbit."),
                     plotOutput("plotsecondpage") ,
                     textOutput("textthingy"),
                     #textOutput("centroid"),
                     p("Data created seperately in the werewolf project. 
                       See <https://github.com/RMHogervorst/werewolf>")
                     
                     )#closes mainpanel
             )# sidebarlayout end
         )#fluidpage end
         )# panel end
) # closes navbarpage
)

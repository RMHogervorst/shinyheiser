testfunctie <- function(left, top, right){
    vertices <- vertices_create(left, top, right)
    names(vertices) <- c("x","y")
    g <-ggplot()+
        lines(vertices, V1, V2, "blue") +
        corners(vertices, V1, V2) + 
        theme_heiser
    print(g)
}

library(lattice)
wireframe(z ~ x * y, data=data)
wireframe(volcano, shade = TRUE,
          aspect = c(61/87, 0.4),
          light.source = c(10,0,10))

testdataframe <- data.frame(
    x=c(.2,0,0, 1, .1), 
    y= c(0,.3,0,1, .15), 
    z=c(0,0,.5,1, 0) 
    )


wireframe(z ~ x * y, data=testdataframe, 
          scales = list( arrows = TRUE, col = "black"),
          par.settings = list(axis.line = list(col = 'transparent')),
          screen = list(z = -245, x = -75),
          outer = TRUE, shade = TRUE, zlab = "")
cloud(z ~ x * y, data=testdataframe, 
      scales = list( arrows = TRUE, col = "black"),
      par.settings = list(axis.line = list(col = 'transparent')),
      )


testfunctie <- function(left, top, right){
    vertices <- vertices_create(left, top, right)
    names(vertices) <- c("x","y")
    g <-ggplot()+
        lines(vertices, V1, V2, "blue") +
        corners(vertices, V1, V2) + 
        theme_heiser
    print(g)
}


testdataframe <- data.frame(
    x=c(.2,0,0, 1, .1), 
    y= c(0,.3,0,1, .15), 
    z=c(0,0,.5,1, 0) 
    )

scatterplot3d(testdataframe, color = "blue")


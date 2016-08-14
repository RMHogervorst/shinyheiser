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

#scatterplot3d::scatterplot3d(testdataframe, color = "blue")

w#erepeople <- readRDS("~/docs/actief/Projecten/werewolf/data/werepeople.RDS")
werepeople <- readRDS("data/werepeople.RDS")
plot(CreateVertices(werepeople, "normal" ,       "wererabbit"   , "werewolf" ,verticeName = FALSE))
points(Prob2Coord(werepeople, "normal" ,       "wererabbit"   , "werewolf", append = FALSE), pch = 4)

ver <- CreateVertices(werepeople, "normal" ,"wererabbit","werewolf" )
point <- Prob2Coord(werepeople, "normal" ,"wererabbit","werewolf", append = TRUE)
library(ggplot2)
ggplot()+
    lines(vert = ver, line_colour = "blue")+
    corners(ver)+
    geom_point(data = point, aes(x,y, color = ethnicity))

ggplot()+
    lines(vert = ver, line_colour = "blue")+
    corners(ver)+
    geom_point(data = point, aes(x,y, color = coinflip))

ggplot()+
    lines(vert = ver, line_colour = "blue")+
    corners(ver)+
    geom_point(data = point, aes(x,y, color = blood_type))
ggplot()+
    lines(vert = ver, line_colour = "blue")+
    corners(ver)+
    geom_point(data = point, aes(x,y, color = sex), alpha = 1/4)+
    theme_heiser +
    geom_point(data = centroidcalculator(point, "sex"), aes(mx,my, color = sex, size = N))+
    geom_point()


## Here I copy the files from my other package. 
## Since it is not on CRAN this is a bit easier.
## you can find more information about this package in:
## https://github.com/RMHogervorst/heisertransform
## 
## 
## 
## This is actually a helper function,
## that does transformation from 3d to 2d projection.
## but it does no checks. 
## 
vertices_create<-function(C1,C2,C3){
    #V1
    v1a<- -sqrt(C3/(C1*(C1+C3)))
    v1b<- -sqrt(C2/(1-C2))
    V1<- c( v1a, v1b)
    #V2
    v2a<-0
    v2b<-sqrt((1-C2)/C2)
    V2<- c( v2a, v2b)
    #V3
    v3a<-sqrt(C1/(C3*(C1+C3)))
    v3b<- -sqrt(C2/(1-C2))
    V3<- c(v3a, v3b)
    rm(v1a, v1b,v2a,v2b, v3a,v3b)
    vertices<-as.data.frame(rbind(V1,V2,V3)) #matrix into dataframe
    vertices
}


## check and fix variables.
check_and_fix_num<-function(variablename){
    if(!class(variablename)== "numeric"){variablename<-as.numeric(variablename)}
    return(variablename)
}


lines<- function(vert, x, y, line_colour){
    return(list(geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]), colour = line_colour ),
                geom_segment(data = vert, aes(x = x[1], xend = x[2], y= y[1], yend= y[2]), colour = line_colour ), #left to up
                geom_segment(data = vert, aes(x = x[2], xend = x[3], y= y[2], yend= y[3]), colour = line_colour )) )#right to up
}

corners<-function(vert, x, y, colour_left = "#cc0000", colour_top = "#ffca00", colour_right = "#00b300", shape = 17, size = 5, stroke = 2){
    return(list(
        geom_point(data = vert[1,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_left),
        geom_point(data = vert[2,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_top),
        geom_point(data = vert[3,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_right)
    ))}
theme_heiser<- theme_grey() %+replace% theme(axis.line=element_blank(),
                                             axis.text.x=element_blank(),
                                             axis.text.y=element_blank(),
                                             axis.ticks=element_blank(),
                                             axis.title.x=element_blank(),
                                             axis.title.y=element_blank(),
                                             legend.position="none",
                                             panel.background=element_blank(),
                                             panel.border=element_blank(),
                                             panel.grid.major=element_blank(),
                                             panel.grid.minor=element_blank(),
                                             plot.background=element_blank())


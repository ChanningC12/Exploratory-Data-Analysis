# The lattice system. lattice is built based on grid
# xyplot: main function for creating scatterplots
# bwplot: box-and-whiskers plot
# histogram: histograms
# stripplot: like a boxplot but with actual points
# dotplot: plot dots on "violin strings"
# splom: scatterplot matrix, like pairs in base plotting system
# levelplot, contourplot: for plotting image data
library(grid)
library(lattice)
# simple scatterplot
library(datasets)
xyplot(Ozone~Wind,data=airquality)
xyplot(Ozone~Wind | factor(Month),data=airquality,layout=c(5,1))

# panel function, each panel gives the subset
set.seed(10)
x=rnorm(100)
f=rep(0:1,each=50)
y=x+f-f*x+rnorm(100,sd=0.5)
xyplot(y~x|factor(f),layout=c(2,1))
# custom panel function
xyplot(y~x|f,panel=function(x,y,...){
    panel.xyplot(x,y,...)
    panel.abline(h=median(y),lty=2)
})

xyplot(y~x|f,panel=function(x,y,...){
    panel.xyplot(x,y,...)
    panel.lmline(x,y,col=2)
})













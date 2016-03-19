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

# ggplot
library(ggplot2)
# plots are made of aesthetic (size,shape,colot) and geom (points,lines), statistics
# factor variables, indicates subset of subsets, needs to be properly labeled
qplot(displ,hwy,data=mpg) # x coord, y coord, data frame
qplot(displ,hwy,data=mpg,color=drv) # color by factor variables
qplot(displ,hwy,data=mpg,geom=c("point","smooth")) # smooth, 95% CI of the trend line
qplot(hwy,data=mpg,fill=drv) # histogram 
# Facets
qplot(displ,hwy,data=mpg,facets=.~drv) # facet, right side: column of the panel, left: row of matrix
qplot(hwy,data=mpg,facets=drv~.,binwidth=2,color=drv)

# read maccs
maccs = readRDS(file = "Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/maacs_env.rds")
load("~/Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/maacs.Rda")
qplot(pm25,data=maccs)
qplot(log(pm25),data=maccs) # fill=
qplot(log(pm25),data=maccs,geom="density")
qplot(log(pm25),log(no2),data=maccs,color="red")+geom_smooth(method="lm")
qplot(log(pm25),log(eno),data=maacs,color=mopos)+geom_smooth(method="lm")

# initial call to ggplot: g = ggplot(maacs,aes(logpm25,NocturnalSympt)) 
# summary(g)
# g+geom_point()+geom_smooth()+facet_grid(.~bmicat)
g = ggplot(maacs,aes(log(pm25),log(eno)))
g + geom_point() + geom_smooth(method="lm") + facet_grid(.~mopos)
g + geom_point(color="steelblue",size=4,alpha=1/2)
g + geom_point(aes(color=mopos),size=4,alpha=1/2) + labs(title="MAACS") + 
    labs(x=expression("log"*PM[2.5]),y=expression("log"*EN)) + geom_smooth() + facet_grid(.~mopos) +
    theme_bw(base_family = "Times")





















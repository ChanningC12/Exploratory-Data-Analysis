# Principles of Analytics Graphics
# 1. Show comparison
# 2. Show casuality, mechanism, explanation, systematic structure
# 3. Show multivariate data
# 4. Integration of evidence
# 5. Describe and document the evidence with appropriate labels, scales, sources, etc.
# 6. Content is king

pollution = read.csv("Desktop/Github//Coursera/Exploratory Data Analysis/avgpm25.csv",colClasses=c("numeric","character","factor","numeric","numeric"))
head(pollution)

# one dimension: 
# five-number summary
summary(pollution$pm25)
# boxplot
boxplot(pollution$pm25,col="blue")
abline(h=12)
# histogram
hist(pollution$pm25,col="green")
abline(v=12,lwd=2)
abline(v=median(pollution$pm25),col="magenta",lwd=4)
hist(pollution$pm25,col="green",breaks=100)
rug(pollution$pm25)
# barplot
barplot(table(pollution$region),col="wheat",main="Number of Couties")

# Two dimensions
boxplot(pm25~region,data=pollution,col="red")
# multiple histograms
par(mfrow=c(2,1),mar=c(4,4,2,1))
hist(subset(pollution,region=="east")$pm25,col="green")
hist(subset(pollution,region=="west")$pm25,col="green")
# scatterplot
with(pollution,plot(latitude,pm25,col=region))
abline(h=12,lwd=2,lty=2)
# multiple scatterplot
par(mfrow=c(1,2),mar=c(5,4,2,1))
with(subset(pollution,region=="east"),plot(latitude,pm25,main="east"))
with(subset(pollution,region=="west"),plot(latitude,pm25,main="west"))

# Additional Resources: R Graph; R Bloggers

# Plotting systems in R
# Base Plotting System: plot, text, line, points, label
library(datasets)
View(cars)
with(cars,plot(speed,dist)) # scatter plot

# The lattice system
library(lattice)
state = data.frame(state.x77,region=state.region)
xyplot(Life.Exp~Income | region, data=state, layout=c(4,1))

# The ggplot2
library(ggplot2)
qplot(displ,hwy,data=mpg)

# Base Graphics
hist(airquality$Ozone)
with(airquality,plot(Wind,Ozone))
airquality = transform(airquality,Month=factor(Month)) # Month - Categorical variable
boxplot(Ozone~Month,airquality,xlab="Month",ylab="Ozone(ppb)")

# Key Parameters:
# pch: the plotting symbol, default is open circle
# lty: the line type, default is solid line. Can be dashed, dotted, etc.
# lwd: the line width, specified as an integer multiple
# col: the plotting color, specified as a number, string, or hex code; the colors() function gives you a vector of colors by name
# xlab, ylab

# Basic function
# plot: scatter plot as default
# lines: add lines to a plot
# points: add points to a plot
# text: add text labels to a plot using specified x,y coordinates
# title
# mtext
# axis

with(airquality,plot(Wind,Ozone))
title(main="Ozone and Wind in NYC")
# Base plot with annotation
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in NYC"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="red"))
legend("topright",pch=1,col=c("blue","red"),legend=c("May","Other Months"))
model = lm(Ozone~Wind,airquality)
abline()

# Basic Plotting Demonstration
x=rnorm(100)
y=rnorm(100)
plot(x,y)
par(mar=c(4,4,2,2))
plot(x,y)
plot(x,y,pch=20)
plot(x,y,pch=19)
plot(x,y,pch=3)
plot(x,y,pch=4)  # example(points)
text(-2,-2,"Qifeng") # assign a label
legend("topleft",legend="Data",pch=20) # legend

fit = lm(y~x)
abline(fit,lwd=3,col="blue")
plot(x,y,xlab="Weight",ylab="Height",main="ScatterPlot",pch=20)
legend("topright",legend="Data",pch=20) # legend
abline(fit,lwd=3,col="red")
z=rpois(100,2)
par(mfrow=c(2,1))
plot(x,y,pch=20)
plot(x,z,pch=19)
par(mar=c(2,2,1,1))

par(mfrow=c(2,2))
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)
par(mfcol=c(2,2))

par(mfrow=c(1,1))
x=rnorm(100)
y=x+rnorm(100)
g=gl(2,50)
g=gl(2,50,labels=c("Male","Female"))
str(g)
plot(x,y)
plot(x,y,type="n")   # make the plot but no content
points(x[g=="Male"],y[g=="Male"],col="green")
points(x[g=="Female"],y[g=="Female"],col="blue")

# Graphic Devices in R
# Graphic Device: Something where you can make a plot appear
# 1. Plot
library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")


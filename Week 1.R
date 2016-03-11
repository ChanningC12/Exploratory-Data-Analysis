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






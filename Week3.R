# Subsetting 
set.seed(13435)
X = data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X = X[sample(1:5),]
X$var2[c(1:3)]=NA
X

X[,1] #subset specific column, or X[,"var1"]
X[1:2,"var2"] #subset both column and row

# logical statement: and, or
X[(X$var1<=3 & X$var3>11),]
X[(X$var1<=3 | X$var3>15),]

# Dealing with missing value
X[which(X$var2>8),]
# Sort
sort(X$var1)
sort(X$var1,decreasing = T)
sort(X$var2,na.last = T)
# Ordering
X[order(X$var1),]
# Ordering with plyr
library(plyr)
arrange(X,var2)
arrange(X,desc(var1))

# Adding rows and columns
X$var4 = rnorm(5)
X
Y=cbind(X,rnorm(5)) # rbind
Y
Z = rbind(X,rnorm(5))
Z


# Hierarchical Clustering
# 1. Distance 
# 2. Merging
set.seed(1234)
par(mar=c(0,0,0,0))
x = rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y = rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
# calculate dist
dataFrame = data.frame(x=x,y=y)
dist(dataFrame) # calculate distance, distance matrix
# start from merging two closet points
distxy=dist(dataFrame)
hClustering = hclust(distxy)
plot(hClustering) # further down, cluster first

# heatmap
# k-means, summarize high dimensional data
# partitioning, fix a number of clusters
# get centroids of each cluster
# assign things to the centroid
# Recalculate centroid
# Requires: a defined distance metric; a number of clusters; an initial guess as to cluster centroids
set.seed(1234)
par(mar=c(0,0,0,0))
x = rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y = rnorm(12,mean=rep(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))
# kmeans()
dataFrame = data.frame(x,y)
kmeansObj = kmeans(dataFrame,centers=3)
names(kmeansObj)
kmeansObj$cluster
kmeansObj
par(mar=rep(0.2,4))
plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)

# Principal Component Analysis
# Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible
# find the best matrix with fewer variables that explains the original data
# Lower dimensional representation that explain the most variation


# Color
# col=1, black; col=2, red; col=3, green
# grDevices package
x = rnorm(1000)
y = rnorm(1000)
smoothScatter(x,y)
par(mar=rep(2,4))



























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


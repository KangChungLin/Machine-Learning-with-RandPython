# Decision Trees
library(rpart)
DT<-rpart(Species ~ ., data = iris)
DT

plot(DT)
text(DT, use.n=F, all=F, cex=1)

# more beautiful plot
library(rpart.plot)
prp(DT)	

library(caret)

# Create index to split based on labels  
index <- createDataPartition(iris$Species, p=0.8, list=FALSE)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

# Train a model
# split = "information" or "gini"
DT<-rpart(Species ~ ., data = iris.training, parms = list(split = "information"))

# plot result
plot(DT)
text(DT, use.n=F, all=F, cex=1)

# more beautiful plot
prp(DT)	

# Predict the labels of the test set
predictions<-predict(DT,iris.test[,1:4], type="class")

# Evaluate the predictions
table(predictions)

# Confusion matrix 
confusionMatrix(predictions,iris.test[,5])


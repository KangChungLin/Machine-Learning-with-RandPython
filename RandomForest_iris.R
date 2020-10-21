library(caret)

# Create index to split based on labels  
index <- createDataPartition(iris$Species, p=0.8, list=FALSE)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

# random forests
library(randomForest)
iris.rf <- randomForest(Species ~ ., data=iris.training, ntree=1000)

# plot mse
plot(iris.rf)

# feature importance
iris.rf$importance

# Predict the labels of the test set
predictions<-predict(iris.rf,iris.test[,1:4], type="class")

# Evaluate the predictions
table(predictions,iris.test[,5])

# Confusion matrix 
confusionMatrix(predictions,iris.test[,5])

# faster package
library(ranger) 
system.time(
  iris.rf <- randomForest(Species ~ ., data=iris.training, ntree=5000)
)
# user  system elapsed 
# 0.47    0.00    0.47


system.time(
  iris.ranger <- ranger(Species ~ ., data=iris.training, num.trees=5000)
)
# user  system elapsed 
# 0.08    0.05    0.06 



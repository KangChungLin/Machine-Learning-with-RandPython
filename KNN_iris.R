library(caret)

# Create index to split based on labels  
index <- createDataPartition(iris$Species, p=0.8, list=FALSE)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

# Train a model
model_knn <- train(iris.training[, 1:4], iris.training[, 5], method='knn')

# Predict the labels of the test set
predictions<-predict.train(object=model_knn,iris.test[,1:4], type="raw")

# Evaluate the predictions
table(predictions,iris.test[,5])

# Confusion matrix 
confusionMatrix(predictions,iris.test[,5])

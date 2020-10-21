library(caret)

# Create index to split based on labels  
index <- createDataPartition(iris$Species, p=0.8, list=FALSE)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

# Train a model
library(e1071)
model <- naiveBayes(Species ~ ., data = iris.training)

# Predict the labels of the test set
predictions<-predict(model,iris.test[,1:4], type="class")

# Evaluate the predictions
table(predictions,iris.test[,5])

# Confusion matrix 
confusionMatrix(predictions,iris.test[,5])

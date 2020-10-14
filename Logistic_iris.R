library(caret)

# Create index to split based on labels  
index <- createDataPartition(iris$Species, p=0.7, list=FALSE)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

# Train a model
logistic_mod = train(
  form = Species ~ .,
  data = iris.training,
  trControl = trainControl(method = "cv", number = 5),
  method = "multinom",
  family = "binomial"
)

# Predict the labels of the test set
predictions<-predict.train(object=logistic_mod,iris.test[,1:4], type="raw")

# Evaluate the predictions
table(predictions)

# Confusion matrix 
confusionMatrix(predictions,iris.test[,5])

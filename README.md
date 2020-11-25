# Machine Learning by R and Python
使用R或Python進行機器學習\
主要使用的資料為鳶尾花資料集(iris dataset)，資料集將鳶尾花分為三類，並有四個特徵值，分別為花萼(sepal)長寬、花瓣(petal)長寬
 
## 1. Logistic Regression
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/logistic.png)
* [Python](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/Logistic_iris.ipynb)
* [R](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/Logistic_iris.R)
 
## 2. K-Nearest Neighbor
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/KNN.png)
* [Python](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/KNN_iris.ipynb)
* [R](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/KNN_iris.R)

## 3. Decision Tree
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/tree.png)
* [Python](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/DecisionTree_iris.ipynb)
* [R](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/DecisionTree_iris.R)

## 4. Naive Bayes
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/Bayes.png)
* [Python](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/NaiveBayes_iris.ipynb)
* [R](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/NaiveBayes_iris.R)

## 5. Random Forests
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/forest.png)
* [Python](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/RndomForest_iris.ipynb)
* [R](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/RandomForest_iris.R)

## 辨別圖片上的數字(簡易版)
圖片皆為黑白照片，將圖片平均分成十六個區域，計算每個區域有幾個像素為黑色(如下圖)。
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/number_pic.jpg)
 \
 \
因此可以得到每張圖片有16個特徵值，將特徵值依序排列形成一維陣列。接著將每張圖片的特徵值全部合併起來，形成二維陣列，每一列(row)為一張圖片的特徵值(如下圖)。
![image](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/picToNum.jpg)
\
\
將圖片轉換成數值陣列即可使用機器學習中的分類方法，本次使用KNN進行分類。
* [Python](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/simple_classify_number.ipynb)

使用deeping learning進行手寫數字辨識
* [Python(Keras)](https://github.com/KangChungLin/Machine-Learning-with-RandPython/blob/master/mnist.ipynb)

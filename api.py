from flask import Flask, jsonify, request
# from flask_cors import CORS, cross_origin
import pickle
import pandas as pd

app = Flask(__name__)
# 允許所有路由(route)上的所有網域進行CORS(Cross-Origin Resource Sharing)
# 讓網頁的受限資源被其他網域的頁面存取
# CORS(app)

# 將model讀進來
model = pickle.load(open('RF_credit.pkl', 'rb'))

# one hot encoder colnames
col = ['Customer_Age', 'Gender', 'Dependent_count',
       'Months_on_book', 'Total_Relationship_Count', 'Months_Inactive_12_mon',
       'Contacts_Count_12_mon', 'Credit_Limit', 'Total_Revolving_Bal',
       'Avg_Open_To_Buy', 'Total_Amt_Chng_Q4_Q1', 'Total_Trans_Amt',
       'Total_Trans_Ct', 'Total_Ct_Chng_Q4_Q1', 'Avg_Utilization_Ratio',
       'Education_Level_College', 'Education_Level_Doctorate',
       'Education_Level_Graduate', 'Education_Level_High School',
       'Education_Level_Post-Graduate', 'Education_Level_Uneducated',
       'Education_Level_Unknown', 'Marital_Status_Divorced',
       'Marital_Status_Married', 'Marital_Status_Single',
       'Marital_Status_Unknown', 'Income_Category_$120K +',
       'Income_Category_$40K - $60K', 'Income_Category_$60K - $80K',
       'Income_Category_$80K - $120K', 'Income_Category_Less than $40K',
       'Income_Category_Unknown', 'Card_Category_Blue', 'Card_Category_Gold',
       'Card_Category_Platinum', 'Card_Category_Silver']

# app.route 為路由，可以藉由這個位置去使用predict()這個函數
# 並指定http method為post


@app.route("/regression-ml/api/v1.0/credit", methods=['POST'])
def predict():
    # 把request過來的JSON內容獲取下來，並轉換成dict
    values = request.get_json()
    # 將dict轉換成pandas dataframe
    input_variables = pd.DataFrame(values, index=['input'])
    # one hot encoder
    input_variables = pd.get_dummies(input_variables)
    input_variables = input_variables.reindex(columns=col, fill_value=0)
    # 獲取模型的預測結果
    prediction = model.predict(input_variables)[0]
    # 將結果轉換成JSON格式
    attrition = {0: 'Attrited Customer', 1: 'Existing Customer'}
    ret = '{"Attrition_Flag":"' + attrition[prediction] + '"}'
    return ret


# 運行REST接口，port=9000 用於直接測試
if __name__ == "__main__":
    app.run(port=9000)

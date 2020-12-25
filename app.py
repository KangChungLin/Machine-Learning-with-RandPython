from flask import Flask, jsonify, request
# from flask_cors import CORS, cross_origin
import pickle
import pandas as pd

app = Flask(__name__)
# 允許所有路由(route)上的所有網域進行CORS(Cross-Origin Resource Sharing)
# 讓網頁的受限資源被其他網域的頁面存取
# CORS(app)

# 將model讀進來
model = pickle.load(open('GBRmodel.pkl', 'rb'))

# app.route 為路由，可以藉由這個位置去使用predict()這個函數
# 並指定http method為post


@app.route("/regression-ml/api/v1.0/boston", methods=['POST'])
def predict():
    # 把request過來的JSON內容獲取下來，並轉換成dict
    values = request.get_json()
    # 將dict轉換成pandas dataframe
    input_variables = pd.DataFrame(values, index=['input'])
    # 獲取模型的預測結果
    prediction = model.predict(input_variables)[0]
    # 將結果轉換成JSON格式
    ret = '{"MEDV":' + str(prediction) + '}'
    return ret


# 運行REST接口，port=5000 用於直接測試
if __name__ == "__main__":
    app.run(port=5000)
    # app.run(debug=False, host='0.0.0.0', port=5000)

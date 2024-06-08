# Bibliotecas necessárias
import pandas as pd
import numpy as np
import yfinance as yf
import matplotlib.pyplot as plt
from statsmodels.tsa.holtwinters import ExponentialSmoothing
from sklearn.preprocessing import PowerTransformer
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from sklearn.metrics import mean_squared_error

#------------------------------------------------------------------------
#PETR4.SA
#------------------------------------------------------------------------

# Seleção de tickers e visualização
tickers = ["^BVSP", "PETR4.SA"]

# Período
startdate = "2022-01-21"
enddate = "2024-05-29"

# Captura dos dados
data = yf.download(tickers, start=startdate, end=enddate)

# Dados de fechamento ajustado
petr4_close = data['Adj Close']['PETR4.SA']

# Gráfico
petr4_close.plot(title='PETR4.SA Adjusted Close Price')
plt.show()

## FEED-FORWARD NEURAL NETWORKS
# Transformação Box-Cox
pt = PowerTransformer(method='box-cox')
petr4_close_transformed = pt.fit_transform(petr4_close.values.reshape(-1, 1))

# Preparação dos dados para o modelo
def create_dataset(series, n_lags):
    X, y = [], []
    for i in range(len(series) - n_lags):
        X.append(series[i:(i + n_lags)])
        y.append(series[i + n_lags])
    return np.array(X), np.array(y)

n_lags = 3
X, y = create_dataset(petr4_close_transformed, n_lags)

# Construção do modelo neural
model = Sequential()
model.add(Dense(50, input_dim=n_lags, activation='relu'))
model.add(Dense(1))
model.compile(loss='mean_squared_error', optimizer='adam')

# Ajuste do modelo
model.fit(X, y, epochs=50, batch_size=1, verbose=2)

## FORECAST
# Previsão para os próximos 7 dias
forecast_horizon = 7
predictions = []

# Usando os últimos n_lags pontos para prever o futuro
last_values = petr4_close_transformed[-n_lags:]

for _ in range(forecast_horizon):
    pred = model.predict(last_values.reshape(1, -1))
    predictions.append(pred[0][0])
    last_values = np.append(last_values[1:], pred[0][0])

# Invertendo a transformação Box-Cox
predictions = pt.inverse_transform(np.array(predictions).reshape(-1, 1))

# Plotando a previsão
future_dates = pd.date_range(start=petr4_close.index[-1], periods=forecast_horizon + 1, closed='right')
plt.plot(petr4_close.index, petr4_close, label='Histórico')
plt.plot(future_dates, predictions, label='Previsão')
plt.legend()
plt.show()

# Avaliação do modelo
train_predict = model.predict(X)
train_predict_inverse = pt.inverse_transform(train_predict)
train_true_inverse = pt.inverse_transform(y)

mse = mean_squared_error(train_true_inverse, train_predict_inverse)
print(f'Mean Squared Error: {mse}')

# Previsão final
price_fcast = pd.DataFrame(predictions, index=future_dates, columns=['Forecast'])
print(price_fcast.head())

# Predição
pred = model.predict(last_values.reshape(1, -1))
pred_inverse = pt.inverse_transform(pred)
print(f'Prediction: {pred_inverse[0][0]}')

#libraries
install.packages("rugarch")
install.packages("tsfknn")
install.packages("BatchGetSymbols")
install.packages("GetDFPData")
library(quantmod)
library(ggplot2)
library(forecast)
library(tseries)
library(rugarch)
library(tsfknn)
library(BatchGetSymbols)
library(GetDFPData)
library(dplyr)

#------------------------------------------------------------------------
#PETR4.SA
#------------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP", "PETR4.SA")

#periodo
startdate = as.Date("2022-01-21")
enddate = as.Date("2024-05-29")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(PETR4.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda = BoxCox.lambda(PETR4.SA$PETR4.SA.Close)
dnn_fit = nnetar(PETR4.SA[,4],lambda=lambda)
dnn_fit

##FORECAST
fcast = forecast(dnn_fit,PI=T,h=7)
autoplot(fcast)
accuracy(dnn_fit)  

#PRICE
price_fcast = fcast
head(price_fcast)

#PREDICT
predict(fcast)


#---------------------------------------------------------------------
#VALE3
# 1
#---------------------------------------------------------------------


#seleção tickers e visualização
tickers = c("^BVSP","VALE3.SA")

#periodo
startdate = as.Date("2022-01-21")
enddate = as.Date("2024-05-27")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(VALE3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda1 = BoxCox.lambda(VALE3.SA$VALE3.SA.Close)
dnn_fit1 = nnetar(VALE3.SA[,4],lambda1=lambda1)
dnn_fit1

#FORECAST
fcast1 = forecast(dnn_fit1,PI=T,h=7)
autoplot(fcast1)
accuracy(dnn_fit1)  

#PRICE
price_fcast1 = fcast1
head(price_fcast1)

#PREDICT
predict(fcast1)

#------------------------------------------------------------------------
#ABEV3.SA
# 2
#------------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP","ABEV3.SA")

#periodo
startdate = as.Date("2022-01-21")
enddate = as.Date("2024-05-29")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(ABEV3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda2 = BoxCox.lambda(ABEV3.SA$ABEV3.SA.Close)
dnn_fit2 = nnetar(ABEV3.SA[,4],lambda2=lambda2)
dnn_fit2

##FORECAST
fcast2 = forecast(dnn_fit2,PI=T,h=7)
autoplot(fcast2)
accuracy(dnn_fit2)  

#PRICE
price_fcast2 = fcast2
head(price_fcast2)

#PREDICT
predict(fcast2)

#---------------------------------------------------------------------
#WEGE3.SA
# 3
#---------------------------------------------------------------------


#seleção tickers e visualização
tickers = c("^BVSP","WEGE3.SA")

#periodo
startdate = as.Date("2022-01-21")
enddate = as.Date("2024-05-27")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(WEGE3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda3 = BoxCox.lambda(WEGE3.SA$WEGE3.SA.Close)
dnn_fit3 = nnetar(WEGE3.SA[,4],lambda3=lambda3)
dnn_fit3

##FORECAST
fcast3 = forecast(dnn_fit3,PI=T,h=7)
autoplot(fcast3)
accuracy(dnn_fit3)  

#PRICE
price_fcast3 = fcast3
head(price_fcast3)

#PREDICT
predict(fcast3)


#---------------------------------------------------------------------
#BBAS3.SA
# 4
#---------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP","BBAS3.SA")

#periodo
startdate = as.Date("2020-01-22")
enddate = as.Date("2024-05-20")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(BBAS3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda4 = BoxCox.lambda(BBAS3.SA$BBAS3.SA.Close)
dnn_fit4 = nnetar(BBAS3.SA[,4],lambda4=lambda4)
dnn_fit4

##FORECAST
fcast4 = forecast(dnn_fit4,PI=T,h=7)
autoplot(fcast4)
accuracy(dnn_fit4)  

#PRICE
price_fcast4 = fcast4
head(price_fcast4)

#PREDICT
predict(fcast4)

#---------------------------------------------------------------------
#POSI3.SA
# 5
#---------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP","POSI3.SA")

#periodo
startdate = as.Date("2023-01-23")
enddate = as.Date("2024-05-28")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(POSI3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda5 = BoxCox.lambda(POSI3.SA$POSI3.SA.Close)
dnn_fit5 = nnetar(POSI3.SA[,4],lambda5=lambda5)
dnn_fit5

##FORECAST
fcast5 = forecast(dnn_fit5,PI=T,h=7)
autoplot(fcast5)
accuracy(dnn_fit5)  

#PRICE
price_fcast5 = fcast5
head(price_fcast5)

#PREDICT
predict(fcast5)

#---------------------------------------------------------------------
#CEAB3.SA
# 6
#---------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP","CEAB3.SA")

#periodo
startdate = as.Date("2021-01-04")
enddate = as.Date("2024-05-28")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(CEAB3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda6 = BoxCox.lambda(CEAB3.SA$CEAB3.SA.Close)
dnn_fit6 = nnetar(CEAB3.SA[,4],lambda6=lambda6)
dnn_fit6

##FORECAST
fcast6 = forecast(dnn_fit6,PI=T,h=7)
autoplot(fcast6)
accuracy(dnn_fit6)  

#PRICE
price_fcast6 = fcast6
head(price_fcast6)

#PREDICT
predict(fcast6)


#---------------------------------------------------------------------
#BBDC3.SA
# 7
#---------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP","BBDC3.SA")

#periodo
startdate = as.Date("2021-01-04")
enddate = as.Date("2024-05-28")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(BBDC3.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda7 = BoxCox.lambda(BBDC3.SA$BBDC3.SA.Close)
dnn_fit7 = nnetar(BBDC3.SA[,4],lambda7=lambda7)
dnn_fit7

##FORECAST
fcast7 = forecast(dnn_fit7,PI=T,h=7)
autoplot(fcast7)
accuracy(dnn_fit7)  

#PRICE
price_fcast7 = fcast7
head(price_fcast7)

#PREDICT
predict(fcast7)

#---------------------------------------------------------------------
#BVSP
# 8
#---------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP")

#periodo
startdate = as.Date("2024-05-01")
enddate = as.Date("2024-05-29")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(BVSP)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda8 = BoxCox.lambda(BVSP$BVSP.Close)
dnn_fit8 = nnetar(BVSP[,4],lambda8=lambda8)
dnn_fit8

##FORECAST
fcast8 = forecast(dnn_fit8,PI=T,h=7)
autoplot(fcast8)
accuracy(dnn_fit8)  

#PRICE
price_fcast8 = fcast8
head(price_fcast8)

#PREDICT
predict(fcast8)


#---------------------------------------------------------------------
#CMIG4.SA
# 9
#---------------------------------------------------------------------

#seleção tickers e visualização
tickers = c("^BVSP","CMIG4.SA")

#periodo
startdate = as.Date("2021-01-04")
enddate = as.Date("2024-05-28")

#captura dos dados
getSymbols(tickers, src="yahoo",from = startdate, to = enddate)

#grafico
chartSeries(CMIG4.SA)

##FEED-FORWARD NEURAL NETWORKS
#Fitting nnetar
lambda9 = BoxCox.lambda(CMIG4.SA$CMIG4.SA.Close)
dnn_fit9 = nnetar(CMIG4.SA[,4],lambda9=lambda9)
dnn_fit9

##FORECAST
fcast9 = forecast(dnn_fit9,PI=T,h=7)
autoplot(fcast9)
accuracy(dnn_fit9)  

#PRICE
price_fcast9 = fcast9
head(price_fcast9)

#PREDICT
predict(fcast9)

#---------------------------------------------------------------------
#fim
#---------------------------------------------------------------------


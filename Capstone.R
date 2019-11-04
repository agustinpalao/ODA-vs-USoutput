require(tseries)
require(forecast)
require(TSA)
ODA<-read.csv("ODAproductionTS.csv")
ODA_US_prod<- ts(ODA$X4437.98,start = c(1967),end = c(2017),frequency = 1)
ODA_US_prod2<-ts(ODA$X4437.98)
plot(ODA_US_prod)

GrossOutput<-read.csv("OutputMnfct.csv")
GrossOutput_Ind<-ts(GrossOutput$X5308.4, start=c(1998), end = c(2018),frequency = 1)
plot(GrossOutput_Ind)


tsfit_ODAprod<-auto.arima(ODA_US_prod)
plot(fcODA<-forecast(tsfit_ODAprod, h=6), xlab = "years", ylab = "Million USD",main="Forecast ODA 2020")

tsfit_Gross_Ind<-auto.arima(GrossOutput_Ind)
plot(fcGross<-forecast(tsfit_Gross_Ind, h=2),xlab = "years", ylab = "Billion USD",main="Forecast Gross Output Industry 2020")

View(EPI_data)
attach(EPI_data)
fix(EPI_data)
EPI
tf = is.na(EPI)
E = EPI[!tf]
summary(EPI)
fivenum(EPI,na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI,seq(30.,95.,1.0),prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.))
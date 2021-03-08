library(readr)
EPI_data <- read_csv("Source Files/EPI_data.csv")
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
plot(ecdf(EPI),do.points = FALSE,verticals = TRUE)
par(pty='s')
qqnorm(EPI)
qqline(EPI)
boxplot(EPI,DALY)
qqplot(EPI,DALY)
EPILand = EPI[!Landlock]
ELand = EPILand[!is.na(EPILand)]
hist(ELand)
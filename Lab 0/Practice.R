days = c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') #days
temp = c(28,30,25,19,33,26,15) #Temperature on that day
snow = c('T','T','T','F','T','F','F') #Snow status on that day
Troy_Weather_Week = data.frame(days,temp,snow)
Troy_Weather_Week
head(Troy_Weather_Week)
str(Troy_Weather_Week)
Troy_Weather_Week[1,] #First row
Troy_Weather_Week[,1] #First column
Troy_Weather_Week[,'snow']
Troy_Weather_Week[1:5,c("snow")]
subset(Troy_Weather_Week,subset = snow == TRUE)
sorted.snow = order(Troy_Weather_Week['snow'])
sorted.snow
Troy_Weather_Week[sorted.snow,]
dec.snow = order(-Troy_Weather_Week$temp) #Descending order of all the days it snowed
dec.snow

empty.DataFrame = data.frame()
v1 = 1:10
v1
letters
v2 = letters[1:10]
df = data.frame(col.name.1 = v1,col.name.2 = v2)
df
write.csv(df,file='sample_df.csv')
df2 = read.csv('sample_df.csv')
df2
##wd
setwd(file.path("C:", "Users", "Ahmed", "Desktop", "Exploratory"))
getwd()

##Read power consumption file
sampledata<- read.csv("power.txt", sep = ";", header= TRUE, nrows = 100)
columns<- sapply(sampledata, class)#Class head
columns[c(1,2)]<-"character"



#Specify NA as ?
df<- read.table("power.txt", header = TRUE, sep= ";", colClasses = columns, na.strings = "?")

#Convert time and date using strptime into a new variable
df$datetime<- strptime(paste(df$Date, "," , df$Time), format= "%d/%m/%Y , %H:%M:%S")


#Subset 1 and 2 February
df$Date<- as.Date(df$Date, format= "%d/%m/%Y" )
date1<- as.Date("2007-2-1", format="%Y-%m-%d")
date2<- as.Date("2007-2-2", format="%Y-%m-%d")
data<-subset(df,df$Date==date1 | df$Date==date2)

#Plot3
windows()
par(mfrow=c(1,1))
plot(data$datetime, data$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, data$Sub_metering_2, "l", col="red")
lines(data$datetime, data$Sub_metering_3, "l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue")) 
title( xlab="")
dev.copy(png, "plot3.png")

dev.off()


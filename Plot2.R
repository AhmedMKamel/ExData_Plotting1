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

#Plot2
windows()
plot(data$datetime, data$Global_active_power, "l", xlab= "", ylab = "Global Active Power (Kilowatts)")
dev.copy(png, "plot2.png")
dev.off()

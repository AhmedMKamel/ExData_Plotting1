##wd
setwd(file.path("C:", "Users", "Ahmed", "Desktop", "Exploratory"))
getwd()

##Read power consumption file
sampledata<- read.csv("power.txt", sep = ";", header= TRUE, nrows = 100)
columns<- sapply(sampledata, class)#Class head
columns[c(1,2)]<-"character"


#Specify NA as ?
df<- read.table("power.txt", header = TRUE, sep= ";", colClasses = columns, na.strings = "?")
df$Date<-as.Date(df$Date, format="%d/%m/%Y")


#Subset 1 and 2 February
date1<- as.Date("2007-2-1", format="%Y-%m-%d")
date2<- as.Date("2007-2-2", format="%Y-%m-%d")
data<-subset(df,df$Date==date1 | df$Date==date2)



##Plot1
windows()
hist(data$Global_active_power,col="red", main= "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.copy(png, "plot1.png")
dev.off()

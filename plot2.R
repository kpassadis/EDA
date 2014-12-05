powerConsumption<-read.table('~/development/R/EDA/household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")
data<-powerConsumption[powerConsumption$Date>=startDate & powerConsumption$Date<=endDate,]
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (KW)",col="red")
rug(data$Global_active_power)

data$dateTime<-strptime(paste(as.character(data$Date), data$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")
plot(data$dateTime, data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(1,type="n")
powerConsumption<-read.table('~/development/R/EDA/household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
startDate<-as.Date("2007-02-01")
endDate<-as.Date("2007-02-02")
data<-powerConsumption[powerConsumption$Date>=startDate & powerConsumption$Date<=endDate,]
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (KW)",col="red")
rug(data$Global_active_power)

data$dateTime<-strptime(paste(as.character(data$Date), data$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")
plot(data$dateTime, data$Global_active_power,type="l",ylab="Global Active Power",xlab="")

plot(data$dateTime, data$Sub_metering_1,type="l",col="red",ylab="Energy sub metering", xlab="")
lines(data$dateTime, data$Sub_metering_2,col="blue")
lines(data$dateTime, data$Sub_metering_3,col="green")
legend('topright', names(data)[7:9] , lty=1, col=c('red', 'blue', 'green',' brown'), bty='n', cex=.75)

old.par<-par(mfrow=c(2,2))
plot(data$dateTime, data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(data$dateTime, data$Voltage, type="l", ylab="Voltage",xlab="")
plot(data$dateTime, data$Sub_metering_1,type="l",col="red",ylab="Energy sub metering", xlab="")
lines(data$dateTime, data$Sub_metering_2,col="blue")
lines(data$dateTime, data$Sub_metering_3,col="green")
legend('topright', names(data)[7:9] , lty=1, col=c('red', 'blue', 'green',' brown'), bty='n', cex=.25)
plot(data$dateTime, data$Global_reactive_power,type="l",ylab="Global Active Power",xlab="")
powerConsumption<-read.table('development/R/eda/household_power_consumption.txt',header=TRUE,sep=';',stringsAsFactors=FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
powerConsumption$Date<-as.Date(powerConsumption$Date,format="%d/%m/%Y")
data<-powerConsumption[powerConsumption$Date>=startDate & powerConsumption$Date<=endDate,]
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (KW)",col="red")
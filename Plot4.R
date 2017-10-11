##read data
setwd("~/Desktop/Git/Week1")
library(data.table)
temp <- fread("household_power_consumption.txt",header = TRUE,na.strings = c("?","","NA"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
PowerData <- subset(temp,temp$Date=="1/2/2007"|temp$Date=="2/2/2007")
PowerData$DateTime <- as.POSIXct(paste(PowerData$Date,PowerData$Time),format = "%d/%m/%Y %H:%M:%S")
PowerData <-PowerData[,c(-1,-2)]
##Plot 4
par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(2,2,2,2))
with(PowerData,{
  plot(PowerData$DateTime,PowerData$Global_active_power,xlab = "",ylab = "Global Active Power",cex.lab=0.8,type="l",cex.axis=0.8)
  plot(PowerData$DateTime,PowerData$Voltage,xlab = "DateTime",ylab = "Voltage",cex.lab=0.8,type = "l",cex.axis=0.8)
  plot(PowerData$DateTime,PowerData$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering", col=1,cex.axis=0.8,cex.lab=0.8)
  lines(PowerData$DateTime,PowerData$Sub_metering_2,col=2)
  lines(PowerData$DateTime,PowerData$Sub_metering_3,col=4)
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c(1,2,4),cex=0.4)
  plot(PowerData$DateTime,PowerData$Global_reactive_power,type = "l",xlab="DateTime",ylab = "Global_reactive_power",cex.lab=0.8,cex.axis=0.8)
})
dev.copy(png,'plot4.png')
dev.off()
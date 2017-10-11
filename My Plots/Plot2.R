##read data
setwd("~/Desktop/Git/Week1")
library(data.table)
temp <- fread("household_power_consumption.txt",header = TRUE,na.strings = c("?","","NA"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
PowerData <- subset(temp,temp$Date=="1/2/2007"|temp$Date=="2/2/2007")
PowerData$DateTime <- as.POSIXct(paste(PowerData$Date,PowerData$Time),format = "%d/%m/%Y %H:%M:%S")
PowerData <-PowerData[,c(-1,-2)]
##Plot 2
plot(PowerData$DateTime,PowerData$Global_active_power,type="l",xlab= "", ylab = "Global_Active_Power(kilowatts)",cex.axis=0.8)
dev.copy(png,'Plot2.png')
dev.off()
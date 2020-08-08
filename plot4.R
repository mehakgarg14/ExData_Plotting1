read<- read.csv("household_power_consumption.txt", sep = ';', na.strings = '?',
                header = T)
data<-subset(read,read$Date=="1/2/2007" | read$Date == "2/2/2007")
data$Date<- as.Date(data$Date, format="%d/%m/%Y")
data$Datetime<- as.POSIXct(paste(data$Date, data$Time))
par(mfrow= c(2,2))
plot(data$Datetime, data$Global_active_power, xlab = "",
     ylab="Global Active Power (kilowatts)", type = "line")

plot(data$Datetime, data$Voltage, xlab = "datetime", ylab = "Voltage",
     type = "line" )

plot(data$Datetime, data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_1, type = "line")
points(data$Datetime, data$Sub_metering_2, type = "line", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "line", col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = c(1,1),
       lwd = 1,
       bty = "n")
plot(data$Datetime, data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "line")

dev.copy(png, file= "plot4.png", height = 480, width= 480)
dev.off()
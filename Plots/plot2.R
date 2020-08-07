read<- read.csv("household_power_consumption.txt", sep = ';', na.strings = '?',
                header = T)
data<-subset(read,read$Date=="1/2/2007" | read$Date == "2/2/2007")
data$Date<- as.Date(data$Date, format="%d/%m/%Y")
data$Datetime<- as.POSIXct(paste(data$Date, data$Time))
plot(data$Datetime, data$Global_active_power,
     ylab="Global Active Power (kilowatts)", type = "line")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
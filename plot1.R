read<- read.csv("household_power_consumption.txt", sep = ';', na.strings = '?',
                header = T)
data<-subset(read,read$Date=="1/2/2007" | read$Date == "2/2/2007")
data$Date<- as.Date(data$Date, format="%d/%m/%Y")
hist(data$Global_active_power,
     xlab = "Global Active Power (killowatts)",ylab = "Frequency",
     main = "Global Active Power", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
temp <- read.delim("household_power_consumption.txt", header=TRUE, sep=";")
for(i in 3:9) temp[[i]] <- as.numeric(temp[[i]])
temp$Date <- as.Date(temp$Date, format="%d/%m/%Y")
temp2 <- subset(temp, temp$Date>="2007-02-01" & temp$Date<="2007-02-02")
temp2$Time <- strptime(paste(temp2$Date, temp2$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("Plot4.png", height = 480, width = 480)
par(mar=c(4.1,4.1,2.1,2.1), mfrow = c(2,2))

plot(temp2$Time, temp2$Global_active_power/1000, type = "l", ylab = "Global Active Power", xlab = " ")

plot(temp2$Time, temp2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(x = temp2$Time, y = temp2$Sub_metering_1, type = "l", ylab = "Energy Sub metering", xlab = " ")
lines(x = temp2$Time, y = temp2$Sub_metering_2, type = "l", col = "red")
lines(x = temp2$Time, y = temp2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 2.5)

plot(temp2$Time, temp2$Global_reactive_power/500, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

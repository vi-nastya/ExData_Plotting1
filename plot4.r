library(sqldf)
data <- read.csv.sql('./data/household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2, 2))
with (data, {plot(DateTime, Global_active_power, type = "l", bg = "transparent", cex.lab = 0.8, cex.axis = 0.8, xlab = "", ylab = "Global active power")
plot(DateTime, Voltage, type = "l", xlab = "datetime", bg = "transparent", cex.lab = 0.8, cex.axis = 0.8, ylab = "Voltage")
plot(data$DateTime, data$Sub_metering_1, type = "l", bg = "transparent", cex.lab = 0.8, cex.axis = 0.8, ylab="Energy sub metering", xlab= "")
lines(data$DateTime, data$Sub_metering_2, col = "red", type = "l", xlab= "")
lines(data$DateTime, data$Sub_metering_3, col = "blue", type = "l", xlab= "")
legend("topright", bty = "n", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DateTime, Global_reactive_power, type = "l", bg = "transparent", cex.lab = 0.8, cex.axis = 0.8, xlab = "datetime", ylab = "Global_reactive_power")
})
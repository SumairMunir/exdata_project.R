# Load necessary package
library(data.table)

# Read Data
data <- fread("household_power_consumption.txt", na.strings="?")

# Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter Data
data_filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02"]

# Convert to numeric
data_filtered$Voltage <- as.numeric(data_filtered$Voltage)
data_filtered$Global_reactive_power <- as.numeric(data_filtered$Global_reactive_power)

# Plot Multiple Graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data_filtered$Global_active_power, type="l", col="black", xlab="Time", ylab="Global Active Power")
plot(data_filtered$Voltage, type="l", col="blue", xlab="Time", ylab="Voltage")
plot(data_filtered$Sub_metering_1, type="l", col="black", xlab="Time", ylab="Energy sub metering")
lines(data_filtered$Sub_metering_2, col="red")
lines(data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

plot(data_filtered$Global_reactive_power, type="l", col="green", xlab="Time", ylab="Global Reactive Power")
dev.off()

# Load necessary package
library(data.table)

# Read Data
data <- fread("household_power_consumption.txt", na.strings="?")

# Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter Data
data_filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02"]

# Convert to numeric
data_filtered$Sub_metering_1 <- as.numeric(data_filtered$Sub_metering_1)
data_filtered$Sub_metering_2 <- as.numeric(data_filtered$Sub_metering_2)
data_filtered$Sub_metering_3 <- as.numeric(data_filtered$Sub_metering_3)

# Plot Sub Metering
png("plot3.png", width=480, height=480)
plot(data_filtered$Sub_metering_1, type="l", col="black", xlab="Time", ylab="Energy sub metering")
lines(data_filtered$Sub_metering_2, col="red")
lines(data_filtered$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()

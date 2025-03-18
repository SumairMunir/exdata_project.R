# Load necessary package
library(data.table)

# Read Data
data <- fread("household_power_consumption.txt", na.strings="?")

# Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter Data
data_filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02"]

# Convert to numeric
data_filtered$Global_active_power <- as.numeric(data_filtered$Global_active_power)

# Plot Histogram
png("plot1.png", width=480, height=480)
hist(data_filtered$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

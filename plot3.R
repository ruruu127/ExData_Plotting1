# Load data
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
# Choose from dates 2007-02-01 and 2007-02-02
dates <- c("1/2/2007", "2/2/2007")
epc <- epc[epc$Date %in% dates,]

# Extract values
datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
fig <- as.numeric(epc$Global_active_power)
submeter1 <- as.numeric(epc$Sub_metering_1)
submeter2 <- as.numeric(epc$Sub_metering_2)
submeter3 <- as.numeric(epc$Sub_metering_3)

# Plot figure as shown
png("plot3.png", height = 480, width = 480)
plot(datetime, submeter1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, submeter2, col = "red")
lines(datetime, submeter3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

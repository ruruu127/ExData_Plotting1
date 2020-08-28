# Load data
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
# Choose from dates 2007-02-01 and 2007-02-02
dates <- c("1/2/2007", "2/2/2007")
epc <- epc[epc$Date %in% dates,]

# Extract values
datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
fig1 <- as.numeric(epc$Global_active_power)
fig2 <- as.numeric(epc$Voltage)
fig3 <- as.numeric(epc$Global_reactive_power)
submeter1 <- as.numeric(epc$Sub_metering_1)
submeter2 <- as.numeric(epc$Sub_metering_2)
submeter3 <- as.numeric(epc$Sub_metering_3)

# Plot figure as shown
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))

##1st plot (1,1)
plot(datetime, fig1, type = "l", xlab = "", ylab = "Global Active Power")
##2nd plot (1, 2)
plot(datetime, fig2, type = "l", xlab = "datetime", ylab = "Voltage")
##3rd plot (2, 1)
plot(datetime, submeter1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, submeter2, col = "red")
lines(datetime, submeter3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "o")
##4th plot (2, 2)
plot(datetime, fig3, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
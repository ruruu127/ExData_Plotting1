# Load data
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset data
# Choose from dates 2007-02-01 and 2007-02-02
dates <- c("1/2/2007", "2/2/2007")
epc <- epc[epc$Date %in% dates,]

# Extract values
datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
fig <- as.numeric(epc$Global_active_power)

# Plot figure as shown
png("plot2.png", height = 480, width = 480)
plot(x = datetime, y = fig, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
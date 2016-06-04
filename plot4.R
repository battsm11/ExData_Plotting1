#same as previous plot
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
jandata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#change vars to numeric

globalactivepower <- as.numeric(jandata$Global_active_power)
globalreactivepower <- as.numeric(jandata$Global_reactive_power)
voltage <- as.numeric(jandata$Voltage)
submetering1 <- as.numeric(jandata$Sub_metering_1)
submetering2 <- as.numeric(jandata$Sub_metering_2)
submetering3 <- as.numeric(jandata$Sub_metering_3)

#create the plots
png("plot4.png", width=480, height=480)
#2 by 2 graphs
par(mfrow = c(2, 2)) 

plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
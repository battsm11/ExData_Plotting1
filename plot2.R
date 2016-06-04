
#same as previous plot
datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
jandata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#change formats of dates and times
datetime <- strptime(paste(jandata$Date, jandata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#turn GAP var into numeric
globalactivepower <- as.numeric(jandata$Global_active_power)
#create plot with w = 480 and h = 480 in png
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

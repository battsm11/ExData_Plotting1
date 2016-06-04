datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
jandata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]


#use str(jandata) to see the var names
globalactivepower <- as.numeric(jandata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
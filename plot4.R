## abbreviated_household_power_consumtion.txt was created so that the source data could be
## uploaded to git. It was created via the following commands:

## data <- read.table("./household_power_consumption.txt", sep=";", header=T)
## data$dt <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
## startDate <- as.POSIXct("2007-02-01 0:0:0")
## endDate <- as.POSIXct("2007-02-02 23:59:59")
## myData <- subset(data, data$dt >= startDate & data$dt < endDate)
## write.csv(myData, "./abbreviated_household_power_consumption.txt")

myData <- read.csv("./abbreviated_household_power_consumption.txt")
myData$dt <- as.POSIXct(myData$dt)
png(file="plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))

plot(myData$dt, as.numeric(as.character(myData$Global_active_power)), type="l", ylab="Global Active Power", xlab="")
plot(myData$dt, as.numeric(as.character(myData$Voltage)), type="l", ylab="Voltage", xlab="datetime")

plot(myData$dt, as.numeric(as.character(myData$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
lines(myData$dt, as.numeric(as.character(myData$Sub_metering_2)), col="red")
lines(myData$dt, as.numeric(as.character(myData$Sub_metering_3)), col="blue")
legend("topright", bty = "n", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

plot(myData$dt, as.numeric(as.character(myData$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()



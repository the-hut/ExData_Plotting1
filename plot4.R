## abbreviated_household_power_consumtion.txt was created so that the source data could be
## uploaded to git. It was created via the following commands:

## data <- read.table("./household_power_consumption.txt", sep=";", header=T)
## data$dt <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
## startDate <- as.POSIXct("2007-02-01 0:0:0")
## endDate <- as.POSIXct("2007-02-02 23:59:59")
## myData <- subset(data, data$dt >= startDate & data$dt < endDate)
## write.csv(myData, "./abbreviated_household_power_consumption.txt")

## Load abbreviated data
myData <- read.csv("./abbreviated_household_power_consumption.txt")

## Cast the dt column as DateTime
myData$dt <- as.POSIXct(myData$dt)

## Set the target graphic device
png(file="plot4.png", width = 480, height = 480, units = "px")

## Allow for 4 graphs to be plotted on one page
par(mfrow = c(2, 2))

## Generate the first plot
plot(myData$dt, as.numeric(as.character(myData$Global_active_power)), type="l", ylab="Global Active Power", xlab="")

## Generate the second plot
plot(myData$dt, as.numeric(as.character(myData$Voltage)), type="l", ylab="Voltage", xlab="datetime")

## Generate the third plot
plot(myData$dt, as.numeric(as.character(myData$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
## Add the red line to the graph
lines(myData$dt, as.numeric(as.character(myData$Sub_metering_2)), col="red")
## Add the blue line to the graph
lines(myData$dt, as.numeric(as.character(myData$Sub_metering_3)), col="blue")
## Add the legend
legend("topright", bty = "n", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

## Add the fourth plot
plot(myData$dt, as.numeric(as.character(myData$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")

## Close the device
dev.off()



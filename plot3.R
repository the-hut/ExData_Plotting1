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
png(file="plot3.png", width = 480, height = 480, units = "px")

## Generate the first line graph
plot(myData$dt, as.numeric(as.character(myData$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")

## Add the second red line plot onto the graph
lines(myData$dt, as.numeric(as.character(myData$Sub_metering_2)), col="red")

## Add the third blue plot onto the graph
lines(myData$dt, as.numeric(as.character(myData$Sub_metering_3)), col="blue")

## Add the legend to the top right-hand corner
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

## Close the device
dev.off()

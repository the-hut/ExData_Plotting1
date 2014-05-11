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
png(file="plot2.png", width = 480, height = 480, units = "px")

## Generate the line graph
plot(myData$dt, as.numeric(as.character(myData$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Close the device
dev.off()
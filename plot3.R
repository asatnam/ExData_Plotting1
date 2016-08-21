#Read Original File
powerdata <- read.table("./data/household_power_consumption.txt", quote="\"", header = TRUE, sep = ";", stringsAsFactors=FALSE)
#Convert Date data type
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
#Filter out only required rows
powerDF <- powerdata[(powerdata$Date=="2007-02-01") | (powerdata$Date=="2007-02-02"),]
#Create datetime for x-axis of the plot
datetime <- paste(powerDF$Date, powerDF$Time, sep = " ")
datetime <- as.POSIXlt(datetime)
#Create plot in windows
plot(datetime, as.numeric(powerDF$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(datetime, as.numeric(powerDF$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(powerDF$Sub_metering_3), type="l", col="blue")
#Add legends
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_2"), lty=1, lwd=1)
#Copy plot to png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
#reinitiate the plotting device to default
plot.new()
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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(datetime, as.numeric(powerDF$Global_active_power), type="l", xlab="", ylab="Global Active Power")
plot(datetime, as.numeric(powerDF$Voltage), type="l", ylab="Voltage")
plot(datetime, as.numeric(powerDF$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(datetime, as.numeric(powerDF$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(powerDF$Sub_metering_3), type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_2"), lty=1, lwd=1, bty="n", cex=.75)
plot(datetime, as.numeric(powerDF$Global_reactive_power), type="l", ylab="Global_reactive_power")

#Copy plot to png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
#reinitiate the plotting device to default
plot.new()
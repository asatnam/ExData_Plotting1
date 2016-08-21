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
plot(datetime, as.numeric(powerDF$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

##if you don't use "stringsAsFactors=FALSE" while reading data in read.table then you need to convert "Global_active_power" as character first and
## .. then convert into numeric and use below code

##plot(datetime, as.numeric(as.character(powerDF$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copy plot to png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
#reinitiate the plotting device to default
plot.new()

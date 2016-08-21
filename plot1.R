#Read Original File
powerdata <- read.table("./data/household_power_consumption.txt", quote="\"", header = TRUE, sep = ";")
#Convert Date data type
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
#Filter out only required rows
powerDF <- subset(powerdata, Date ==  "2007-02-01" | Date == "2007-02-02")
#Remove original dataset no longer needed from memory
rm(powerdata)
#Create plot in windows
hist(as.numeric(powerDF$Global_active_power), main="Global Active Power" ,col='red', xlab = "Global Activer Power (kilowatts)", ylab="Frequency")
#Copy plot to png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
#reinitiate the plotting device to default
plot.new()



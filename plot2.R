myData <- read.csv("C:/Users/pvumeshchandra/Desktop/PE_EDA/ExData_Plotting1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")
# Subset the data
data <- subset(myData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(myData)
# Date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
# Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

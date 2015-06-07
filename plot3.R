data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

# convert dates so we can filter
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset to dates of interest
plotData <- data[which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time),"%Y-%m-%d %H:%M:%S") # add DateTime column
rm(data)
png("plot3.png", bg="transparent", width=480, height=480, units="px")
plot(plotData$DateTime,plotData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotData$DateTime, plotData$Sub_metering_2, type="l", col="red")
lines(plotData$DateTime,plotData$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1))
dev.off()
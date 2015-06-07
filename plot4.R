data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

# convert dates so we can filter
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset to dates of interest
plotData <- data[which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time),"%Y-%m-%d %H:%M:%S") # add DateTime column
rm(data)
png("plot4.png", bg="transparent", width=480, height=480, units="px")
op <- par(mfrow=c(2,2))
#plot1
plot(plotData$DateTime,plotData$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power")
# plot2
plot(plotData$DateTime,plotData$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# plot3
plot(plotData$DateTime,plotData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotData$DateTime, plotData$Sub_metering_2, type="l", col="red")
lines(plotData$DateTime,plotData$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), 
       lty=c(1,1,1),
       bty="n")
#plot4
plot(plotData$DateTime,plotData$Global_reactive_power, 
     type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")

par(op)
dev.off()
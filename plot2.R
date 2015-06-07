data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

# convert dates so we can filter
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset to dates of interest
plotData <- data[which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
plotData$DateTime <- strptime(paste(plotData$Date,plotData$Time),"%Y-%m-%d %H:%M:%S") # add DateTime column
rm(data)
png("plot2.png", bg="transparent", width=480, height=480, units="px")
plot(plotData$DateTime,plotData$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
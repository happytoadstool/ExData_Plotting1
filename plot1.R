data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

# convert dates so we can filter
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# subset to dates of interest
plotData <- data[which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
rm(data)
png("plot1.png", bg="transparent", width=480, height=480, units="px")
hist(plotData$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power"
     )
dev.off()

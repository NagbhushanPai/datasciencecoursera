# Sample code from plot1.R [1][5]
power_data <- read.table("household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings="?",
                        colClasses=c("character", "character", rep("numeric",7)))

# Filter to Feb 1-2, 2007
subset_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007"), ]

# plot2.R
datetime <- strptime(paste(subset_data$Date, subset_data$Time), 
                    "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, subset_data$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

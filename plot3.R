# read data from CSV file
data <- read.csv('household_power_consumption.txt',
                 sep = ';',
                 na.strings = '?',
                 colClasses = c(rep('character', 2), rep('numeric', 7)),
                 header = TRUE)

# keep only data from 1/2/2007 and 2/2/2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# create new column for absolute time and cast data type
data$Date_time <- paste(data$Date, data$Time, sep = ' ')
data$Date_time <- strptime(data$Date_time, format = '%d/%m/%Y %H:%M:%S')

# make the plot
plot(data$Date_time, data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(data$Date_time, data$Sub_metering_2, col = 'red')
lines(data$Date_time, data$Sub_metering_3, col = 'blue')

legend("topright",
       col=c("black", "red", "blue"),
       lty = 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save the plot to PNG file
dev.copy(png, file = 'plot3.png')
dev.off()
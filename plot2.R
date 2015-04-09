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

# launch graphic device
png(filename = 'plot2.png')

# make the plot
plot(data$Date_time, data$Global_active_power,
     type='l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

dev.off()
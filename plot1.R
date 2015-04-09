# read data from CSV file
data <- read.csv('household_power_consumption.txt',
                 sep = ';',
                 na.strings = '?',
                 colClasses = c(rep('character', 2), rep('numeric', 7)),
                 header = TRUE)

# keep only data from 1/2/2007 and 2/2/2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# launch graphic device
png(filename = 'plot1.png')

# make a plot
hist(data$Global_active_power,
     col = 'red',
     xlab = 'Global Active Power (kilowatts)',
     breaks = 12,
     main = 'Global Active Power')

dev.off()
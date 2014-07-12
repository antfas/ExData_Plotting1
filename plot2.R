### download data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip', 'curl')
###unzip data
unzip('household_power_consumption.zip')
#### read data
electric_usage = read.csv2('household_power_consumption.txt')
electric_usage[, 1] = as.Date(electric_usage[, 1], '%d/%m/%Y')
## subset on dates
subset = electric_usage[as.Date('2007-02-01') <= electric_usage$Date, ]
subset = subset[subset$Date <= as.Date('2007-02-02'), ]
datetime = strptime(paste(subset$Date, subset$Time), '%Y-%m-%d %T')
global_active_power = as.numeric(as.character(subset$Global_active_power))
plot(datetime, global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.copy(png, 'plot2.png', height=480, width=480)
dev.off()
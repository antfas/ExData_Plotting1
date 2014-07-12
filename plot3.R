##download source data
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip', 'curl')

##unzip
unzip('household_power_consumption.zip')
##read
electric_usage = read.csv2('household_power_consumption.txt')
electric_usage[, 1] = as.Date(electric_usage[, 1], '%d/%m/%Y')
##subet on dates
subset = electric_usage[as.Date('2007-02-01') <= electric_usage$Date, ]
subset = subset[subset$Date <= as.Date('2007-02-02'), ]
datetime = strptime(paste(subset$Date, subset$Time), '%Y-%m-%d %T')

sub_metering_1 = as.numeric(as.character(subset$Sub_metering_1))
sub_metering_2 = as.numeric(as.character(subset$Sub_metering_2))
sub_metering_3 = as.numeric(as.character(subset$Sub_metering_3))
##name file
png(filename="plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(datetime, sub_metering_2, type='l', col='red', xlab='', ylab='Energy sub metering')
lines(datetime, sub_metering_3, type='l', col='blue', xlab='', ylab='Energy sub metering')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()
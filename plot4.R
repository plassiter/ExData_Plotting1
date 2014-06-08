ReadTable <- function(skip, nrow) {
  read.table('household_power_consumption.txt', header=FALSE,
             stringsAsFactors=FALSE, skip=skip, nrow=nrow, sep=';')
}
d <- ReadTable(66637, 2880)
names(d) <- ReadTable(0, 1)
date.time <- strptime(paste(d$Date, d$Time), '%d/%m/%Y %H:%M:%S')

png('plot4.png', 480, 480)
par(mfrow = c(2, 2))
with(d, {
  # global active power over time
  plot(date.time, Global_active_power, xlab='',
       ylab='Global Active Power', type='l')
  
  # voltage over time
  plot(date.time, Voltage, xlab='datetime',
       ylab='Voltage', type='l')
  
  # energy sub metering over time
  plot(date.time, Sub_metering_1, type='l',
       ylab='Energy sub metering', xlab='')
  legend('topright', lty=1, col=c('black', 'red', 'blue'), bty='n',
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  points(date.time, Sub_metering_2, type='l',
         col='red')
  points(date.time, Sub_metering_3, type='l',
         col='blue')
  
  # global reactive power over time
  plot(date.time, Global_reactive_power, xlab='datetime',
       ylab='Global_reactive_power', type='l')
})
dev.off()
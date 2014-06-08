ReadTable <- function(skip, nrow) {
  read.table('household_power_consumption.txt', header=FALSE,
             stringsAsFactors=FALSE, skip=skip, nrow=nrow, sep=';')
}
d <- ReadTable(66637, 2880)
names(d) <- ReadTable(0, 1)
date.time <- strptime(paste(d$Date, d$Time), '%d/%m/%Y %H:%M:%S')

png('plot3.png', 480, 480)
with(d, {
  plot(date.time, Sub_metering_1, type='l',
       ylab='Energy sub metering', xlab='')
  points(date.time, Sub_metering_2, type='l',
         col='red')
  points(date.time, Sub_metering_3, type='l',
         col='blue')
  legend('topright', lty=1, col=c('black', 'red', 'blue'),
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  
})
dev.off()
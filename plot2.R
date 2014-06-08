ReadTable <- function(skip, nrow) {
  read.table('household_power_consumption.txt', header=FALSE,
             stringsAsFactors=FALSE, skip=skip, nrow=nrow, sep=';')
}
d <- ReadTable(66637, 2880)
names(d) <- ReadTable(0, 1)
date.time <- strptime(paste(d$Date, d$Time), '%d/%m/%Y %H:%M:%S')

png('plot2.png', 480, 480)
plot(date.time, d$Global_active_power, xlab='',
     ylab='Global Active Power (kilowatts)', type='l')
dev.off()
ReadTable <- function(skip, nrow) {
  read.table('household_power_consumption.txt', header=FALSE,
             stringsAsFactors=FALSE, skip=skip, nrow=nrow, sep=';')
}
d <- ReadTable(66637, 2880)
names(d) <- ReadTable(0, 1)

png('plot1.png', 480, 480)
hist(d$Global_active_power, main='Global Active Power',
     xlab='Global Active Power (kilowatts)', col='red')
dev.off()
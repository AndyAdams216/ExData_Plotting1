##
## Create a png file for the histogram of global active power
##

## read in data for power consumption from 2007-02-01 to 2007-02-02
power <- read.table( "household_power_consumption.txt", sep=";", header=FALSE, na.strings=c("?"), 
                     colClass=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     nrows= 2880, skip=66637, 
                     col.names=c("date","time","global active power","global reactive power","voltage","global intensity","sub metering 1","sub metering 2","sub metering 3"))

## convert date column to date class
power$date <- as.Date(power$date, format="%d/%m/%Y")

## convert time column to time class
power$time <- strptime(paste(power$date, power$time), format= "%Y-%m-%d %H:%M:%S")

## copy plot to a png file
png( filename="plot1.png", width=480, height=480, units="px")

## draw histogram of global active power 
hist(power$global.active.power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## close png file
dev.off()
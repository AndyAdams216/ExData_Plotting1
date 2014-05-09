##
## Create a png file for the line graph of Energy Sub Metering against time
##

## read in data for power consumption from 2007-02-01 to 2007-02-02
power <- read.table( "household_power_consumption.txt", sep=";", header=FALSE, na.strings=c("?"), 
                     colClass=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                     nrows=2880, skip=66637, 
                     col.names=c("date","time","global active power","global reactive power","voltage","global intensity","sub_metering_1","sub_metering_2","sub_metering_3"))

## convert date column to date class
power$date <- as.Date(power$date, format="%d/%m/%Y")

## convert time column to time class
power$time <- strptime(paste(power$date, power$time), format= "%Y-%m-%d %H:%M:%S")

## copy plot to a png file
png( filename="plot3.png", width=480, height=480, units="px")

## draw line graph of global active power against time
plot(power$time, power$sub_metering_1, type="n", main="", ylab="Energy Sub Metering", xlab="")
lines(power$time, power$sub_metering_1, col="black")
lines(power$time, power$sub_metering_2, col="red")
lines(power$time, power$sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd="1", y.intersp=1.0)

## close png file
dev.off()
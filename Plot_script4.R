
## 

## read required data

## required to setwd() to folder containing /household_power_consumption.txt file
	df=read.table("./household_power_consumption.txt",header=T, sep=";")

## convert the date string to Date structure in format %d/%m/%Y
	df$Date <- strptime(df$Date, format="%d/%m/%Y")

## subset the data base on required date  
	data <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]
  
   #plot 4
	png("plot4.png", width=400, height=400)

	par(mfrow=c(2,2))
	# 1
	plot(data$Time, data$Global_active_power,
		 type="l",
		 xlab="",
		 ylab="Global Active Power")
	# 2
	plot(data$Time, data$Voltage, type="l",
		 xlab="datetime", ylab="Voltage")
	# 3
	plot(data$Time, data$Sub_metering_1, type="l", col="black",
		 xlab="", ylab="Energy sub metering")
	lines(data$Time, data$Sub_metering_2, col="red")
	lines(data$Time, data$Sub_metering_3, col="blue")
	legend("topright",
		   col=c("black", "red", "blue"),
		   c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		   lty=1,
		   box.lwd=0)
	# 4
	plot(data$Time, data$Global_reactive_power, type="n",
		 xlab="datetime", ylab="Global_reactive_power")
	lines(data$Time, data$Global_reactive_power)


## closing the device
	dev.off()

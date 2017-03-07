
## 

## read required data

## required to setwd() to folder containing /household_power_consumption.txt file
	df=read.table("./household_power_consumption.txt",header=T, sep=";")

## convert the date string to Date structure in format %d/%m/%Y
	df$Date <- strptime(df$Date, format="%d/%m/%Y")

## subset the data base on required date  
	sub_df <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]
  
   #plot 3
	png("plot3.png", width=400, height=400)
	plot(data$Time, data$Sub_metering_1, type="l", col="black",
		 xlab="", ylab="Energy sub metering")
	lines(data$Time, data$Sub_metering_2, col="red")
	lines(data$Time, data$Sub_metering_3, col="blue")
	legend("topright",
		   col=c("black", "red", "blue"),
		   c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		   lty=1)

## closing the device
	dev.off()

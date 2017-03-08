 

## 

## read required data

## required to setwd() to folder containing /household_power_consumption.txt file
	df=read.table("./household_power_consumption.txt",header=T, sep=";")

## convert the date string to Date structure in format %d/%m/%Y
	df$Date <- strptime(df$Date, format="%Y-%m-%d")

## subset the data base on required date  
	data <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]
  
   #plot 2
	png("plot2.png", width=400, height=400)

	
	plot(data$Time, data$Global_active_power,
		 type="l",
		 xlab="",
		 ylab="Global Active Power (kilowatts)")

## closing the device
	dev.off()

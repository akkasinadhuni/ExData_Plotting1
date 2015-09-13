# This code is written as part of the Course Project-1 of Exploratory Data Analysis Course in Coursera

#---------Reading the data into the appropriate format using the "dplyr" package as learnt in 'GCD' course.

origdata <- read.table("household_power_consumption.txt", sep=";", quote="",header=T, stringsAsFactors = F, na.strings = "?", dec=".")
library(dplyr)
tdata <- tbl_df(origdata)
data <- filter(tdata,Date=="1/2/2007"|Date=="2/2/2007")
data$Date <- as.Date(data$Date, "%d/%m/%Y") # Reading date as "year-month-day".
# data$Time <- strptime(data$Time,format = "%H:%M:%S")
data$datetime <- as.POSIXct(paste(data$Date, data$Time, sep =" "))

# Generating plot

GAP <- as.numeric(data$Global_active_power)
GRP <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
submetering1 <- as.numeric(data$Sub_metering_1)
submetering2 <- as.numeric(data$Sub_metering_2)
submetering3 <- as.numeric(data$Sub_metering_3)

png(filename = "plot4.png", width=480, height= 480)
par(mfrow = c(2,2))

plot(data$datetime, GAP, type="l", xlab="", ylab = "Global Active Power")

plot(data$datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$datetime, submetering1, type= "l", xlab="", ylab="Energy sub metering")
lines(data$datetime, submetering2, type= "l", col = "red", xlab="", ylab="Energy sub metering")
lines(data$datetime, submetering3, type= "l", col = "blue", xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(data$datetime, GRP, type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()

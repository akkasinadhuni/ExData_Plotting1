# This code is written as part of the Course Project-1 of Exploratory Data Analysis Course in Coursera.

#---------Reading the data into the appropriate format using the "dplyr" package as learnt in 'GCD' course.

        origdata <- read.table("household_power_consumption.txt", sep=";", quote="",header=T, stringsAsFactors = F, na.strings = "?", dec=".")
        library(dplyr)
        tdata <- tbl_df(origdata)
        data <- filter(tdata,Date=="1/2/2007"|Date=="2/2/2007")
        data$Date <- as.Date(data$Date, "%d/%m/%Y") # Reading date as "year-month-day".
        
        
##------------- Generating Plot -------------
        
        # Creating the numeric vector to be plotted. 
        
        v <- as.numeric(data$Global_active_power)
        png(filename = "plot1.png", width=480, height=480)
        hist(v, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
        dev.off()
        
        

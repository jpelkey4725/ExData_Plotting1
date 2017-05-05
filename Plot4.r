install.packages("graphics")
install.packages("lubridate")
library(graphics)
library(lubridate)

# This R script will create Plot2.png from Exploratory data Analysis Week 1 programming assignment

# Set working directory for location of all data files for assignment

setwd("~/R/Exploratory Data Analysis/exdata%2Fdata%2Fhousehold_power_consumption/")

# Read data into power_dataset. Limit data read in by only reading rows 6638 through 69516. All columns are read for simplicity.

power_dataset <- read.csv("~/R/Exploratory Data Analysis/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".")[c(66638:69516),1:9]

# Global_Active_Power column is read in as a factor.  Change to numeric format by using as.numeric function. Save as Glob_Act_Power

Glob_Act_Power <-as.numeric(power_dataset$Global_active_power)

# Combine date and time into single column named datetime

datetime<- strptime(paste(power_dataset$Date, power_dataset$Time), "%d/%m/%Y %H:%M") 


# Open graphic file device using png command with width/height 480

png(filename = "Plot4.png", width = 480, height = 480)

# setup 2x2 column for output

par(mfcol=c(2,2),mar=c(5,5,2,1), oma=c(2,2,2,2))

# first plot in location 1,1 is the plot2.r WITH MAIN TITLE REMOVED 

plot(datetime, Glob_Act_Power, xlab=" ", ylab="Global Active Power (kilowatts)", type='l')

# Second plot in location 2,1 is Energy sub metering vs. datetime from plot3.r WITHOUT BOX AROUND LEGEND

plot(datetime, power_dataset$Sub_metering_1,type="l",col="black", ylab="Energy sub metering", xlab=" ")
lines(datetime, power_dataset$Sub_metering_2,col="red")
lines(datetime, power_dataset$Sub_metering_3,col="blue") 
legend('topright', c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red','blue'), bty='n', pt.cex=1, cex=0.75)

# Third plot in location 1,2 is plot of voltage vs. datetime

plot(datetime, power_dataset$Voltage, ylab="Voltage", xlab="datetime", type='l')

# Fourth plot in location 2,2 is plot of Global reactive power vs. datetime

plot(datetime, power_dataset$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type='l')


# close the device
dev.off()


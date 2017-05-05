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

png(filename = "Plot2.png", width = 480, height = 480)

# Plot the Global ACtive Power vs. datetime
plot(datetime, Glob_Act_Power, main="Global Active Power", ylab="Global Active Power (kilowatts)", type='l')

# close the device
dev.off()

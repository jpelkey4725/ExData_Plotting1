install.packages("graphics")
library(graphics)

# This R script will create Plot1.png from Exploratory data Analysis Week 1 programming assignment

# Set working directory for location of all data files for assignment

setwd("~/R/Exploratory Data Analysis/")

# Read data into power_dataset. Limit data read in by only reading rows 6638 through 69516. All columns are read for simplicity.

power_dataset <- read.csv("~/R/Exploratory Data Analysis/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".")[c(66638:69516),1:9]


# Global_Active_Power column is read in as a factor.  Change to numeric format by using as.numeric function. Save as Glob_Act_Power

Glob_Act_Power <-as.numeric(power_dataset$Global_active_power)

# Open graphic file device using png command with width/height 480

png(filename = "Plot1.png", width = 480, height = 480)

# Plot the histogram

hist(Glob_Act_Power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# close the device
dev.off()

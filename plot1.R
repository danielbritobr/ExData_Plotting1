# Load packages
library(lubridate)
library(dplyr)

# Read data
db <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert dates
db <- db %>% mutate(Date = dmy(Date)) %>% filter(Date >= "2007-02-01", Date <= "2007-02-02")

# For each plot you should

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code
# in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced.
# You should also include the code that creates the PNG file.
# Add the PNG file and R code file to your git repository

png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(db, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()

#week days are shown in portuguese because of my location system (Brazil)
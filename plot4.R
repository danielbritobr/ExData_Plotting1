#Plot 4

# Load packages
library(lubridate)
library(dplyr)

# Read data
db <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert and filter date
db <- db %>%
  mutate(Date = dmy(Date)) %>%
  filter(Date >= "2007-02-01", Date <= "2007-02-02") %>%
  mutate(new_date = ymd_hms(paste(Date, Time, " ")))



# For each plot you should

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code
# in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced.
# You should also include the code that creates the PNG file.
# Add the PNG file and R code file to your git repository


png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(db, {
  plot(new_date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(new_date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(new_date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(new_date, Sub_metering_1, col = "grey")
    lines(new_date, Sub_metering_2, col = "red")
    lines(new_date, Sub_metering_3, col = "blue")
    legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red", "blue"))
  plot(new_date, Global_reactive_power, type = "l", xlab = "datetime")
  })
dev.off()

#week days are shown in portuguese because of my location system (Brazil)
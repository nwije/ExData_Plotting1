# Set working directory
setwd ("C:/Users/Nilmini/Dropbox/Phd/Coursework/JH Datascience/github/exploratory data/week 1/ExData_Plotting1")
rm(list=ls())

# Download and unzip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./data/data.zip")
unzip("./data/data.zip",exdir="data")

# Read file
data.full <- read.table("./data/household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

# Load required libraries
library(lubridate)

# Subset based on date
data.full$Date <- dmy(data.full$Date)
data <- subset(data.full, (Date >= as.POSIXct("2007-02-01 00:00") & 
                             Date <= as.POSIXct("2007-02-02 23:59:59")))

# Create date and time variable
data$datetime=paste(data$Date,data$Time)
data$datetime <- strptime(data$datetime, format="%Y-%m-%d %H:%M:%S")


## Plot 2

png(file="plot2.png",width=480, height=480, units="px")
with(data,plot(datetime,Global_active_power, 
               type="l",
               xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

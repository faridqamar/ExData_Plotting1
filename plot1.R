library(lubridate)
## Read data from file
electric <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.string=c("?",""))

## turn Date and Time into date and time classes
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$timetemp <- paste(electric$Date, electric$Time)
electric$Time <- ymd_hms(electric$timetemp)

## select only data for dates 01/02/2007 and 02/02/2007
electric <- electric[,][electric$Date == as.Date("01/02/2007", format="%d/%m/%Y") | electric$Date == as.Date("02/02/2007", format="%d/%m/%Y"),]

## plot1
png(file="./plot1.png",  width = 480, height = 480, units = "px")
with(electric, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()
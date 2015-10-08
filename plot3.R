library(lubridate)
## Read data from file
electric <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.string=c("?",""))

## turn Date and Time into date and time classes
electric$Date <- as.Date(electric$Date, format="%d/%m/%Y")
electric$timetemp <- paste(electric$Date, electric$Time)
electric$Time <- ymd_hms(electric$timetemp)

## select only data for dates 01/02/2007 and 02/02/2007
electric <- electric[,][electric$Date == as.Date("01/02/2007", format="%d/%m/%Y") | electric$Date == as.Date("02/02/2007", format="%d/%m/%Y"),]

## plot3
png(file="./plot3.png",  width = 480, height = 480, units = "px")
with(electric, {
        plot(Sub_metering_1 ~ Time, type="l", xlab="", ylab="Energy sub metering", col="black")
        lines(Sub_metering_2 ~ Time, col="red")
        lines(Sub_metering_3 ~ Time, col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
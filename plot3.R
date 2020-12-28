pc <- read.table("~/Desktop/Coursera_RProgramming/ExData_Plotting/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

pc$Date <- as.Date(pc$Date, format= "%d/%m/%Y")

Feb1n2pc <- subset(pc, Date >="2007-02-01" & Date <= "2007-02-02")

Feb1n2pc2 <- Feb1n2pc[complete.cases(Feb1n2pc),]

dateTime <- paste(Feb1n2pc2$Date,Feb1n2pc2$Time)

dateTime <- setNames(dateTime,"DateTime")

#Remove Date and Time 
Feb1n2pc2 <- Feb1n2pc2[-c(1,2)]

## Add DateTime new field
Feb1n2pc2 <- cbind(dateTime, Feb1n2pc2)

##Format DateTime
Feb1n2pc2$dateTime <- as.POSIXct(dateTime)

## Plot 3
with(Feb1n2pc2, {
  plot(Sub_metering_1~dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
  lines(Sub_metering_2~dateTime,col='Red') 
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(2,2,2), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

pc <- read.table("~/Desktop/Coursera_RProgramming/ExData_Plotting/household_power_consumption.txt",header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

pc$Date <- as.Date(pc$Date, format= "%d/%m/%Y")

Feb1n2pc <- subset(pc, Date >="2007-02-01" & Date <= "2007-02-02")

Feb1n2pc2 <- Feb1n2pc[complete.cases(Feb1n2pc),]
##as.character(Feb1n2pc$Global_active_power)
##Feb1n2pc2 <- Feb1n2pc %>%
 ## filter(Global_active_power != "?")

g_a_p <- Feb1n2pc2$Global_active_power

hist(as.numeric(g_a_p),col="red",main="Global Active Power", xlab="Global Active Power (killowatts)",ylab="Frequency")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

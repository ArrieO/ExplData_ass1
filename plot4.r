data <- read.csv("household_power_consumption.txt",
skip=66637,
nrows=2880,
na.strings = "?",
header=F,
sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power (kilowatts)",main="")
plot(data$DateTime,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering",main="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",
lwd=1,
lty=1,
col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime,data$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage",main="")
plot(data$DateTime,data$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power",main="")
dev.off()

mydata<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.string="?")
data<-mydata
# developed a new attribute called datetime
data["datetime"]<-NA
data$datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# set the right format for the Date attribute
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")

# select only the dates between 2007-02-01 and 2007-02-02
subset<- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ),]

#create a multiple base plot screen
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(1,1,2,1))


plot(subset$datetime, subset$Global_active_power, type ='l', xlab="", ylab="Global Active Power")
plot(subset$datetime, subset$Voltage, type ='l', xlab="datetime", ylab="Voltage")

plot(subset$datetime, subset$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
points(subset$datetime, subset$Sub_metering_2, col="red", type="l")
points(subset$datetime, subset$Sub_metering_3, col="blue", type="l")
legend("topright", pch = "_" , col = c("black", "red", "blue"), bty = "n",cex=0.7, box.lwd = 0,box.col = "white",bg = "white",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subset$datetime, subset$Global_reactive_power, type ='l', xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()


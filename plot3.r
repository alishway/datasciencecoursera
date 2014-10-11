mydata<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.string="?")
data<-mydata
# developed a new attribute called datetime
data["datetime"]<-NA
data$datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# set the right format for the Date attribute
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")

# select only the dates between 2007-02-01 and 2007-02-02
subset<- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ),]

#create a plot screen
plot(subset$datetime, subset$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
points(subset$datetime, subset$Sub_metering_2, col="red", type="l")
points(subset$datetime, subset$Sub_metering_3, col="blue", type="l")
legend("topright", pch = "_" , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.copy(png, file = "plot3.png")
dev.off()


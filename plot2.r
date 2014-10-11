mydata<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.string="?")
data<-mydata
# developed a new attribute called datetime
data["datetime"]<-NA
data$datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# set the right format for the Date attribute
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")

# select only the dates between 2007-02-01 and 2007-02-02
subset<- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ),]

#create a plot 

plot(subset$datetime, subset$Global_active_power, type ='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()


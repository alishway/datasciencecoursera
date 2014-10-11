mydata2<-read.table("household_power_consumption.txt", header= TRUE, sep=";", na.string="?")
data<-mydata2
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
datesubset<- data[(data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ),]
hist(datesubset$Global_active_power, col = "red", main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="")

dev.copy(png, file = "plot1.png")
dev.off()
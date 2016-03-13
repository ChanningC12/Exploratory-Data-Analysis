# Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

dataFile = "./Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/household_power_consumption.txt"
data = read.table(dataFile,header=T,sep=";",stringsAsFactors=F,dec=".")
subMetering1 = as.numeric(subSetData$Sub_metering_1)
subMetering2 = as.numeric(subSetData$Sub_metering_2)
subMetering3 = as.numeric(subSetData$Sub_metering_3)
voltage = as.numeric(subSetData$Voltage)
globalReactivePower = as.numeric(subSetData$Global_reactive_power)
globalActivePower = as.numeric(subSetData$Global_active_power)

# subset data
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007"),]
# plot 1
png("./Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/plot1.png",width=480,height=480)
hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

# plot 2
datetime = strptime(paste(subSetData$Date,subSetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
png("./Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/plot2.png",width=480,height=480)
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

# plot 3
png("./Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/plot3.png",width=480,height=480)
plot(datetime,subMetering1,type="l",ylab="Energy Submetering",xlab="")
lines(datetime,subMetering2,type="l",col="red")
lines(datetime,subMetering3,type="l",col="blue")
legend("topright",c("Sub_metering1","Sub_metering2","Sub_metering3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()

# plot 4
png("./Desktop/Github/Coursera/Exploratory Data Analysis/Exploratory Data Analysis/plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# 1/4
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# 2/4
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# 3/4
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# 4/4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()










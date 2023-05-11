preDays<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
preDays$Date<-as.Date(preDays$Date, "%d/%m/%Y")
fDay<-preDays[preDays$Date=="2007-02-01",]
sDay<-preDays[preDays$Date=="2007-02-02",]
twoDays<-rbind(fDay,sDay)
##twoDays$Time<-strptime(twoDays$Time, "%H:%M:%S")
dateTime <- as.POSIXlt(paste(twoDays$Date, twoDays$Time), format="%Y-%m-%d %H:%M:%S")

plot(dateTime,twoDays$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
points(dateTime, twoDays$Sub_metering_2, col="red", type="l")
points(dateTime, twoDays$Sub_metering_3, col="blue", type="l")
legend("topright", pch="-", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file= "plot3.png")
dev.off()

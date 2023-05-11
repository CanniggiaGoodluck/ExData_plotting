preDays<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
preDays$Date<-as.Date(preDays$Date, "%d/%m/%Y")
fDay<-preDays[preDays$Date=="2007-02-01",]
sDay<-preDays[preDays$Date=="2007-02-02",]
twoDays<-rbind(fDay,sDay)
##twoDays$Time<-strptime(twoDays$Time, "%H:%M:%S")
dateTime <- as.POSIXlt(paste(twoDays$Date, twoDays$Time), format="%Y-%m-%d %H:%M:%S")
gap<-twoDays[,3]
plot(dateTime,gap,type="l", xlab="", ylab="Global Active Power (kilowatts")
dev.copy(png, file= "plot2.png")
dev.off()

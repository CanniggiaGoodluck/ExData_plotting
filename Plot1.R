preDays<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
preDays$Date<-as.Date(preDays$Date, "%d/%m/%Y")
fDay<-preDays[preDays$Date=="2007-02-01",]
sDay<-preDays[preDays$Date=="2007-02-02",]
twoDays<-rbind(fDay,sDay)
hist(as.numeric(twoDays$Global_active_power), 
      freq=TRUE, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file= "plot1.png")
dev.off()

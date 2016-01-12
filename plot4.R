alldata = read.table("Data/household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors=F)

plotdata <- subset(alldata,
                   (alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007" ) )

G_RP <- as.numeric(plotdata$Global_reactive_power)
G_AP <- as.numeric(plotdata$Global_active_power)
Voltage <- as.numeric(plotdata$Voltage)
x<-paste(plotdata$Date,plotdata$Time)
mydate = strptime(x,format = '%d/%m/%Y %H:%M:%S')
sub_met1 <- as.numeric(plotdata$Sub_metering_1)
sub_met2 <- as.numeric(plotdata$Sub_metering_2)
sub_met3 <- as.numeric(plotdata$Sub_metering_3)

png(filename = "plot4.png", width = 480, height = 480)
old.par <- par(mfrow=c(2,2))
# plot 1
plot(mydate,G_AP,"l",
     ylab = "Global Active Power (kilowatts)",xlab = "")
# End of plot 1
# plot 2
plot(mydate,Voltage,"l",
     ylab = "Voltage",xlab = "datetime")
# End of plot 2
# plot 3
plot(mydate,sub_met1,"l",ylab = ""
     ,xlab = "")
par(new=T)
plot(mydate,sub_met2,"l",col = "red",ylab = ""
     ,xlab = "",ylim = c(0,40),axes = F)
par(new=T)
plot(mydate,sub_met3,"l",col = "blue",ylab = "Energy sub metering"
     ,xlab = "",ylim = c(0,40),axes = F)
legend(x="topright",y=NULL,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),
       lty = c(1,1,1), col = c("black","red","blue"),bty = "n")
# End of plot 3
# plot 4
plot(mydate,G_RP,"l",
     ylab = "Global_reactive_power",xlab = "datetime")
# End of plot 4
par(old.par)


dev.off()
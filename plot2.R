alldata = read.table("Data/household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors=F)

plotdata <- subset(alldata,
                   (alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007" ) )

x<-paste(plotdata$Date,plotdata$Time)
mydate = strptime(x,format = '%d/%m/%Y %H:%M:%S')
G_AP <- as.numeric(plotdata$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)
plot(mydate,G_AP,"l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()
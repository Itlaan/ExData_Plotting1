alldata = read.table("Data/household_power_consumption.txt",header = TRUE, sep = ";",stringsAsFactors=F)

plotdata <- subset(alldata,
                   (alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007" ) )
G_AP <- as.numeric(plotdata$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(G_AP,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
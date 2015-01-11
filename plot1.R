library(data.table)
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
epcDT <- data.table(epc)
epc <- c()
epcData <- epcDT[Date==c("1/2/2007","2/2/2007"),]
epcDT <- c()

epcDataOne <- epcData[ , Global_active_power:=as.numeric(Global_active_power)]
hist(epcData$Global_active_power, col="red", xlab="Global active power (kilowatts)", ylim=c(0, 1200), main=paste("Global Active Power"))
dev.copy(png, file = "plot1.png") 
dev.off()

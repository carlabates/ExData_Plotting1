library(data.table)
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
epcDT <- data.table(epc)
epc <- c()
epcData <- epcDT[Date==c("1/2/2007","2/2/2007"),]
epcDT <- c()

epcX<- epcData[ , daytime:=as.POSIXct(paste(epcData$Date, epcData$Time), format = "%d/%m/%Y %H:%M:%S")]
with(epcX, plot(daytime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=.7, cex.axis=.8))
dev.copy(png, file = "plot2.png") 
dev.off()

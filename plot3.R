
dfPowConsmption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

dfPowConsmption$Date <- as.Date(dfPowConsmption$Date,"%d/%m/%Y")

dfPowConsmptionFiltered <- dfPowConsmption[(dfPowConsmption$Date >= "2007-02-01" & dfPowConsmption$Date <= "2007-02-02"),] 

dfPowConsmptionFiltered$Time <- strptime(paste(dfPowConsmptionFiltered$Date,  dfPowConsmptionFiltered$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

dfPowConsmptionFiltered$Sub_metering_1 <- as.numeric(dfPowConsmptionFiltered$Sub_metering_1)

dfPowConsmptionFiltered$Sub_metering_2 <- as.numeric(dfPowConsmptionFiltered$Sub_metering_2)

dfPowConsmptionFiltered$Sub_metering_3 <- as.numeric(dfPowConsmptionFiltered$Sub_metering_3)

png("plot3.png", width=480, height=480)

with(dfPowConsmptionFiltered, { 
  plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metring")
  lines(Time, Sub_metering_2, type="l" , col="red")
  lines(Time, Sub_metering_3, type="l", col="blue")}
  )

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
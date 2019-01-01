
dfPowConsmption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

dfPowConsmption$Date <- as.Date(dfPowConsmption$Date,"%d/%m/%Y")

dfPowConsmptionFiltered <- dfPowConsmption[(dfPowConsmption$Date >= "2007-02-01" & dfPowConsmption$Date <= "2007-02-02"),] 

dfPowConsmptionFiltered$Time <- strptime(paste(dfPowConsmptionFiltered$Date,  dfPowConsmptionFiltered$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

dfPowConsmptionFiltered$Global_active_power <- as.numeric(dfPowConsmptionFiltered$Global_active_power)

png("plot2.png", width=480, height=480)

plot(dfPowConsmptionFiltered$Time, dfPowConsmptionFiltered$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
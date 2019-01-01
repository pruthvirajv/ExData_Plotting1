
dfPowConsmption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)

dfPowConsmption$Date <- as.Date(dfPowConsmption$Date,"%d/%m/%Y")

dfPowConsmption$Time <- strptime(dfPowConsmption$Time, format = "%H:%M:%S", tz = "")

dfPowConsmptionFiltered <- dfPowConsmption[(dfPowConsmption$Date >= "2007-02-01" & dfPowConsmption$Date <= "2007-02-02"),] 

dfPowConsmptionFiltered$Global_active_power <- as.numeric(dfPowConsmptionFiltered$Global_active_power)

png("plot1.png", width=480, height=480)

hist(dfPowConsmptionFiltered$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
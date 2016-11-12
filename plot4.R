library(dplyr)

dat <- read.csv2("./Data/household_power_consumption.txt", stringsAsFactors = FALSE) #read in dataset
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y") #convert date variable to Date format type
dat <- filter(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) #filter to 2 day span

#convert character variables to numeric format type
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$Voltage <- as.numeric(dat$Voltage)
dat$Global_intensity <- as.numeric(dat$Global_intensity)
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)

#add the time variable to the date variable
dat$Date_Time <- paste(dat$Date, dat$Time)
dat$Date_Time <- as.POSIXlt(dat$Date_Time, format = "%Y-%m-%d %H:%M:%S")
dat <- dat[, c(10,3,4,5,6,7,8,9)]
dat <- rename(dat, Date = Date_Time)

#create plot4.png
png('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))
plot(dat$Date, dat$Global_active_power, type="n", xlab="", 
     ylab="Global Active Power")
lines(dat$Date, dat$Global_active_power, type="l")
plot(dat$Date, dat$Voltage, type="n", xlab="datetime", 
     ylab="Voltage")
lines(dat$Date, dat$Voltage, type="l")
plot(dat$Date, dat$Sub_metering_1, type="n", xlab="", 
     ylab="Energy sub metering")
lines(dat$Date, dat$Sub_metering_1, type="l")
lines(dat$Date, dat$Sub_metering_2, type="l", col = "red")
lines(dat$Date, dat$Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), col=c("black", "red", "blue"), bty="n")
plot(dat$Date, dat$Global_reactive_power, type="n", xlab="datetime", 
     ylab="Global_reactive_power")
lines(dat$Date, dat$Global_reactive_power, type="l")
dev.off()
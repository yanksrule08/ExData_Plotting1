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

#create plot1.png
par(mfrow=c(1,1))
png('plot1.png', width = 480, height = 480)
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
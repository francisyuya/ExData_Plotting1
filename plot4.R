setwd("D:/MOOC/Coursera/data exploratory")

#loading data
data = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#=== subsetting data from 2007-02-01 to 2007-02-02
data$Date = as.Date(as.character(data$Date), format = "%d/%m/%Y")
data = data[which(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")), ]

#converting date and time to DateTime variable
data$Date_Time = paste(data$Date, data$Time, sep = " ")
data$Date_Time = strptime(data$Date_Time, format = "%Y-%m-%d %H:%M:%S")


#========== plotting graph 4
png(file = "plot4.png")
par(mfrow = c(2,2))

#add to line 1 column 1
with(data, plot(Global_active_power, xaxt="none", type = "l", ylab = "Global Active Power",
                xlab = ""))

#add to line 1 column 2
with(data, plot(Voltage, xaxt="none", type = "l", ylab = "Voltage",
                xlab = "datetime"))


#add to line 2 column 1
with(data, plot(Sub_metering_1, xaxt="none", type = "l", ylab = "Energy Sub metering",
                xlab = ""))
with(data, lines(Sub_metering_2, xaxt="none", type = "l", col = "red"))
with(data, lines(Sub_metering_3, xaxt="none", type = "l", col = "blue"))

legend("topright", legend=c("Sub metering_1", "Sub metering_2", "Sub metering_3"),
       col=c("black", "red", "blue"), lty=1:3, cex=0.8)

#add to line 2 column 2
with(data, plot(Global_reactive_power, xaxt="none", type = "l", ylab = "Global_reactive_power",
                xlab = "datetime"))

dev.off()

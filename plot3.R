setwd("D:/MOOC/Coursera/data exploratory")

#loading data
data = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#=== subsetting data from 2007-02-01 to 2007-02-02
data$Date = as.Date(as.character(data$Date), format = "%d/%m/%Y")
data = data[which(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")), ]

#converting date and time to DateTime variable
data$Date_Time = paste(data$Date, data$Time, sep = " ")
data$Date_Time = strptime(data$Date_Time, format = "%Y-%m-%d %H:%M:%S")



#========== plotting graph 3
png(file = "plot3.png")
with(data, plot(Sub_metering_1, xaxt="none", type = "l", ylab = "Energy Sub metering",
                xlab = ""))
with(data, lines(Sub_metering_2, xaxt="none", type = "l", col = "red"))
with(data, lines(Sub_metering_3, xaxt="none", type = "l", col = "blue"))

legend("topright", legend=c("Sub metering_1", "Sub metering_2", "Sub metering_3"),
       col=c("black", "red", "blue"), lty=1:3, cex=0.8)

dev.off()


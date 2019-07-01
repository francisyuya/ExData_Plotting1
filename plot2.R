setwd("D:/MOOC/Coursera/data exploratory")

#loading data
data = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#=== subsetting data from 2007-02-01 to 2007-02-02
data$Date = as.Date(as.character(data$Date), format = "%d/%m/%Y")
data = data[which(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")), ]

#converting date and time to DateTime variable
data$Date_Time = paste(data$Date, data$Time, sep = " ")
data$Date_Time = strptime(data$Date_Time, format = "%Y-%m-%d %H:%M:%S")


#========== plotting graph 2
png(file = "plot2.png")
with(data, plot(Global_active_power, xaxt="none", type = "l", ylab = "Global Active Power (kilowatts)",
                xlab = ""))
#axis(1, at=1:3)
dev.off()


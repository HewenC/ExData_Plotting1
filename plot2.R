#read entire table
mydata= read.table("household_power_consumption.txt",sep=';', header = TRUE, colClasses = c("character","character","double","double","double","double","double","double","numeric"),na.strings ='?')
#convert data type of Date  
mydata$Date=as.Date(mydata$Date, format="%d/%m/%Y")
#select subset data
subdata = mydata[mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"),]

#combining day and time to create a new posix date
subdata$Posix = paste(subdata$Date, subdata$Time)
subdata$DateTime = strptime(subdata$Posix, format = "%Y-%m-%d %H:%M:%S")

#plot graph2
png(filename="plot2.png",width=480,height=480, units = "px")
with(subdata,
     plot(DateTime,
          Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)"))
dev.off()


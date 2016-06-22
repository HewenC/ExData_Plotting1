#read entire table
mydata= read.table("household_power_consumption.txt",sep=';', header = TRUE, colClasses = c("character","character","double","double","double","double","double","double","numeric"),na.strings ='?')
#convert data type of Date  
mydata$Date=as.Date(mydata$Date, format="%d/%m/%Y")
#select subset data
subdata = mydata[mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"),]

#combining day and time to create a new posix date
subdata$Posix = paste(subdata$Date, subdata$Time)
subdata$DateTime = strptime(subdata$Posix, format = "%Y-%m-%d %H:%M:%S")

#plot4
png(filename="plot4.png",width=480,height=480, units = "px")
par(mfrow = c(2,2))
#plot 1st graph
with(subdata,
     plot(DateTime,
          Global_active_power,
          type = 'l',
          xlab='',
          ylab='Global Active Power'))

#plot 2nd graph
with(subdata,
     plot(DateTime,
          Voltage,
          type = 'l',
          xlab='datetime',
          ylab='Voltage'))

#plot 3rd graph
with(subdata,
     plot(DateTime,
          Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering",
          col = 'black'))
with(subdata,
     lines(DateTime,
            Sub_metering_2,
            col='red'))
with(subdata,
     lines(DateTime,
            Sub_metering_3,
            col='blue'))
legend("topright", col = c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1)

#plot 4th graph
with(subdata,
     plot(DateTime,
          Global_reactive_power,
          xlab='datetime',
          type = 'l'))

dev.off()


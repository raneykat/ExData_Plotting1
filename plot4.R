# Coursera Exploratory Data Analysis Course Project Part 1
# Katherine Raney
# December 2014
# Plot 4

#setwd("C:\\raneykat_git\\ExploratoryDataAnalysis\\ExData_Plotting1")

# first read in the data
dat <- read.table("household_power_consumption.txt", header =TRUE,sep=";")

# these are the dates we want
date1 <- "1/2/2007"
date2 <- "2/2/2007"

# work just with this subset 
dat2 <- dat[dat$Date ==date1 | dat$Date ==date2,]

#remove the other from memory
rm(dat)

# concatenate date and time into a sigle column
dat2$datetime <- paste(dat2$Date,dat2$Time)

# convert datetime datatype from string
dat2$datetime2 <- strptime(dat2$datetime,format="%d/%m/%Y %H:%M:%S")

#get the day of the week
library(lubridate)

dat2$dow <- wday(dat2$datetime2,label=TRUE)

#plot 3 - submetering 1,2,3
# x = datetime like before
# y = sub metering w different lines for 1,2,3
# y label is "Energy sub metering"
# 1 is black, 2 is red, 3 is blue
# stair steps?

#convert to numeric for convencience
dat2$Sub_metering_1 <- as.numeric(as.character(dat2$Sub_metering_1))
dat2$Sub_metering_2 <- as.numeric(as.character(dat2$Sub_metering_2))
dat2$Sub_metering_3 <- as.numeric(as.character(dat2$Sub_metering_3))
dat2$Global_active_power <- as.numeric(dat2$Global_active_power)
dat2$Voltage <- as.numeric(as.character((dat2$Voltage)))
dat2$Global_reactive_power <- as.numeric(as.character(dat2$Global_reactive_power))

yrange <- c(0,40)


# send a plot to a png file 
png(file="plot4.png",bg="transparent")
par(mfrow = c(2, 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(dat2,{
  #global active power kw
  plot(datetime2,Global_active_power/500
                ,type="l",ylab="Global Active Power (kilowats)",xlab="",width = 480, height = 480)
  
  #voltage 
  plot(datetime2,dat2$Voltage
       ,type="l",ylab="Voltage",xlab="",width = 480, height = 480)
  
    #submetering
  plot(datetime2,as.numeric(Sub_metering_1),ylim=yrange,
                ,type="s",ylab="Energy sub metering",xlab="",width = 480, height = 480)
  lines(dat2$datetime2, dat2$Sub_metering_1,type="s",col="black" )
  lines(dat2$datetime2, dat2$Sub_metering_2,type="s",col="red" )
  lines(dat2$datetime2, dat2$Sub_metering_3,type="s",col="blue" )
  legend("topright", col = c("black","blue", "red"), lty=c(1,1,1),legend = c("Sub metering 1"
                                                                           , "Sub metering 2"
                                                                           ,"Sub metering 3"))

  #global reactive power
       plot(datetime2,dat2$Global_reactive_power,ylab="Global_reactive_power"
            ,type="l",,xlab="",ylim=c(0.0,0.5),width = 480, height = 480)
  
  }) 
dev.off()

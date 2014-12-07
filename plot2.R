# Coursera Exploratory Data Analysis Course Project Part 1
# Katherine Raney
# December 2014
# Plot 2

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


# send a plot to a png file 
png(file="plot2.png",bg="transparent",width = 480, height = 480)
with(dat2, plot(datetime2,as.numeric(Global_active_power)/500
                ,type="l",ylab="Global Active Power (kilowats)",xlab="")) 
dev.off()

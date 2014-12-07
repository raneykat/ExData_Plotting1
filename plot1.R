# Coursera Exploratory Data Analysis Course Project Part 1
# Katherine Raney
# December 2014
# Plot 1

#setwd("C:\\raneykat_git\\ExploratoryDataAnalysis\\ExData_Plotting1")

# first read in the data
dat <- read.table("household_power_consumption.txt", header =TRUE,sep=";")

# these are the dates we want
date1 <- "1/2/2007"
date2 <- "2/2/2007"

# work just with this subset 
dat2 <- dat[dat$Date ==date1 | dat$Date ==date2,]
rm(dat)

# send a histogram to a png file 
png(file="plot1.png",bg="transparent",width = 480, height = 480)
hist(as.numeric(dat2$Global_active_power)/500,xlab = "Global Active Power (kilowats)",main = "Global Active Power",col="red")
dev.off()

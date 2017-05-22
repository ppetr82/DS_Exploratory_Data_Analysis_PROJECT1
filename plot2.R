#Exploratory Data Analysis - Course Project 1
#Reading the data from the file
myData <- read.table("/Users/petrpodrouzek/Documents/coursera/household_power_consumption.txt", 
                    header = TRUE, 
                    sep = ";", 
                    #stringsAsFactors = FALSE,
                    fill = TRUE,
                    na.strings = '?',
                    colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double")
                    )
#Dealing with the date format
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- subset(myData, myData$Date >= "2007-02-01" & myData$Date <= "2007-02-03")
#Merging date and time
myData$DateAndTime <- paste(myData$Date, myData$Time, sep = " ")
myData$DateAndTime <- strptime(myData$DateAndTime, format="%Y-%m-%d %H:%M:%S")
myData <- subset(myData, myData$DateAndTime >= "2007-02-01 00:00:00" & myData$DateAndTime <= "2007-02-03 00:00:00")
#Final dataframe to plot 
myData <- myData[,c("DateAndTime",
                    "Global_active_power",
                    "Global_reactive_power",
                    "Voltage",
                    "Global_intensity",
                    "Sub_metering_1", 
                    "Sub_metering_2", 
                    "Sub_metering_3")]

#plotting charts
#Plot 2
par(mfrow=c(1,1))
plot(myData$DateAndTime, 
     myData$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")
#Save to the file
dev.copy(png, 
         "/Users/petrpodrouzek/Documents/coursera/DS_Exploratory_Data_Analysis_PROJECT1/plot2.png",
         height=480,
         width=480)
dev.off()


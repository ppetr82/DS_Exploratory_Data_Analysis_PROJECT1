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
#Plot 4
par(mfrow=c(2,2))
#Plot top left
plot(myData$DateAndTime, 
     myData$Global_active_power, 
     type="l",
     ylab="Global Active Power", 
     xlab="")

#Plot top right
plot(myData$DateAndTime, 
     myData$Volta, 
     type="l",
     ylab="Voltage", 
     xlab="datatime")
#Plot bottom left
plot(myData$DateAndTime, 
     myData$Sub_metering_1, 
     type="l",
     ylab="Energy sub metering", 
     xlab="",
     col="black")
lines(myData$DateAndTime, 
      myData$Sub_metering_2, 
      col="red")
lines(myData$DateAndTime, 
      myData$Sub_metering_3, 
      col="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lwd=c(2,2),
       bty="n",
       cex=0.7)
#Plot bottom right
plot(myData$DateAndTime, 
     myData$Global_reactive_power, 
     type="l",
     ylab="Global_reactive_power", 
     xlab="datetime",
     col="black")
#Save to the file
dev.copy(png, 
         "/Users/petrpodrouzek/Documents/coursera/DS_Exploratory_Data_Analysis_PROJECT1/plot4.png",
         height=480,
         width=480)
dev.off()


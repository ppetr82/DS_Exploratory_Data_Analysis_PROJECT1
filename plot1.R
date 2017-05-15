myData <- read.table("/Users/petrpodrouzek/Documents/coursera/household_power_consumption.txt", 
                    header = TRUE, 
                    sep = ";", 
                    #stringsAsFactors = FALSE,
                    fill = TRUE,
                    na.strings = '?',
                    colClasses = c("character", "character", "double", "double", "double", "double", "double", "double", "double")
                    )
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- subset(myData, myData$Date >= "2007-02-01" & myData$Date <= "2007-02-03")
myData$DateAndTime <- paste(myData$Date, myData$Time, sep = " ")
myData$DateAndTime <- strptime(myData$DateAndTime, format="%Y-%m-%d %H:%M:%S")
myData <- subset(myData, myData$DateAndTime >= "2007-02-01 00:00:00" & myData$DateAndTime <= "2007-02-03 00:00:00")
#myData$Time <- as.Date(myData$Time, format="%H/%M/%S")

summary(myData)

#to do: commentaries
#plot charts
